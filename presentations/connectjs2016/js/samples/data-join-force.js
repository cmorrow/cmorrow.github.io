var updateForce = (function() {
    var width = 480
    var height = 405

    var radius = 26

    var alphabet = 'abcdefgh'.split('')

    var activeStep
    var stepCount = 11

    var svg = d3.select('#results').append('svg')
        .attr('width', width)
        .attr('height', height)

    var dataLabel = svg.append('text')
        .attr('x', 12)
        .attr('y', 23)

    var nodes = []
    var enterNodes = []
    var updateNodes = []

    var update = svg.selectAll('.node').data(nodes)
    var enter = update.enter()
    var exit = update.exit()

    var simulation = d3.forceSimulation();
        

    // loop()

    function loop() {
        step(10)
        enter.each(function(d) { d.oldFill = 'green' })
        update.each(function(d) { d.oldFill = 'black' })
        exit.remove()

        nodes = updateNodes
        updateNodes = []
        enterNodes = []

        var letters = d3.shuffle(alphabet)
            .slice(0, Math.floor(Math.random() * alphabet.length) + 1)
            .sort()

        letters.forEach(function(letter) {
            var node = nodes.find(function(d) {
                return d.letter === letter })
            if (!node) {
                node = { letter: letter }
                enterNodes.push(node)
            }
            updateNodes.push(node)
        })

        nodes = nodes.concat(enterNodes)

        update = svg.selectAll('.node').data(updateNodes, function(d) {
            return d.letter })
        enter = update.enter().append('g').attr('class', 'node')
            .each(function(d) { d.oldFill = '#aaa' })
        exit = update.exit()

        enter.append('circle')
            .attr('class', 'bg')
            .attr('r', 0)

        enter.append('text')
            .attr('dy', '.25em')
            .attr('opacity', 0)
            .text(function(d) {
                return d.letter })

        enter.append('circle')
            .attr('class', 'selected')
            .attr('r', radius + 4)
            .attr('stroke-dasharray', '6,5')
            .attr('opacity', 0)

        dataLabel.text('data = ["' + letters.join('", "') + '"]')

        simulation
            .nodes(nodes)
            .alpha(1)
            .restart()

        step(1)
    }

    function step(_) {
        var el, number
        if (typeof _ === 'number') {
            el = d3.select('#step-' + _)
            number = _
        } else {
            el = _
            number = parseInt(_.attr('id').split('-')[1], 10)
        }

        activeStep = number

        d3.selectAll('.step-group').classed('active', false)
        d3.selectAll('.step').classed('active', false)
        d3.selectAll('.step-description').classed('active', false)

        el.classed('active', true)
        d3.select(el.node().parentNode).classed('active', true)
        d3.select('#step-description-' + number).classed('active', true)

        var state = d3.set(el.attr('class').split(' '))

        var i = 0

        enter.each(function(d) {
            d.fx = state.has('enter-circle') ? null : (++i) * radius + 4
            d.fy = state.has('enter-circle') ? null : radius * 2 + 8
            d.active = state.has('enter-circle')
        })

        exit.each(function(d) { d.active = !state.has('exit-remove') })

        if (!state.has('pulse')) {
            enter.merge(update).selectAll('.bg').interrupt()
        }

        enter.selectAll('.bg')
            .transition()
            .attr('r', function() {
                return state.has('enter-circle') ? radius : 0 })
            .style('fill', function(d) {
                return state.has('enter-fill') ? 'green' : d.oldFill })

        update.selectAll('.bg')
            .transition()
            .attr('r', radius)
            .style('fill', function(d) {
                return state.has('update-fill') ? '#000' : d.oldFill })

        exit.selectAll('.bg')
            .transition()
            .attr('r', function() {
                return !state.has('exit-remove') ? radius : 0 })
            .style('fill', function(d) {
                return state.has('exit-fill') ? 'red' : d.oldFill })

        enter.selectAll('text')
            .attr('opacity', function() {
                return state.has('data-bound') ? 1 : 0 })
            .style('fill', function() {
                return state.has('enter-circle') ? '#fff' : '#000' })

        exit.selectAll('text')
            .attr('opacity', function() {
                return state.has('exit-remove') ? 0 : 1 })

        enter.selectAll('.selected')
            .attr('opacity', function() {
                return state.has('enter-selected') ? 1 : 0 })

        update.selectAll('.selected')
            .attr('opacity', function() {
                return state.has('update-selected') ? 1 : 0 })

        exit.selectAll('.selected')
            .attr('opacity', function() {
                return state.has('exit-selected') && !state.has('exit-remove') ? 1 : 0 })

        if (state.has('pulse')) {
            enter.merge(update)
                .selectAll('.bg')
                .transition()
                .on('start', function repeat() {
                    d3.active(this).attr('r', radius - 2)
                        .transition().duration(600).attr('r', radius + 2)
                        .transition().on('start', repeat)
                })
        }

        simulation.nodes(nodes)
        if (simulation.alpha() < 0.3) { simulation.alpha(0.3).restart() }
    }

    function ticked() {
        svg.selectAll('.node')
            .attr('transform', function(d) {
                return 'translate(' + d.x + ',' + d.y + ')' })
    }

    window.focus();

    d3.select(window).on('keydown', function() {
        var number = activeStep

        switch (d3.event.keyCode) {
            case 37:
                number -= 1;
                break // left
            case 38:
                number -= 1;
                break // up
            case 39:
                number += 1;
                break // right
            case 40:
                number += 1;
                break // down
        }

        if (number !== activeStep) {
            d3.event.preventDefault()
            if (number > stepCount) { loop() } else if (number > 0) { step(number) }
        }
    })

    d3.selectAll('.step').on('mouseover', function() { step(d3.select(this)) });

    function start(){
    	simulation.on('tick', ticked)
        .force('centerX', d3.forceX(width / 2).strength(0.05))
        .force('centerY', d3.forceY(height / 2).strength(0.05))
        .force('collide', d3.forceCollide(function(d) {
            return d.active ? radius + 6 : 0 }))
        .nodes(nodes)

        loop();
    }

    function stop(){
    	simulation.stop();
    }

    return {
    	start: start,
    	stop: stop
    }
})();
