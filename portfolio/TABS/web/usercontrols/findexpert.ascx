<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="findexpert.ascx.cs" Inherits="TABS_UserControls.usercontrols.findexpert" %>


<div class="fae-search">
    <div class="bt">&nbsp;</div>
    <div class="bm left">
        <div class="bl left">
            <h3>Search by Specialty and Location</h3>
            <b>Specialty</b>
            <div class="fae-form">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td><input id="check1" type="checkbox" value="Colleges" name="option1"/><label for="check1">Colleges</label></td>
                            <td><input id="check2" type="checkbox" value="Special Needs" name="option2"/><label for="check2">Special Needs</label></td>
                        </tr>
                        <tr>
                            <td><input id="check3" type="checkbox" value="Schools (Boarding)" name="option3"/><label for="check3">Schools (Boarding)</label></td>
                            <td><input id="check4" type="checkbox" value="Other" name="option4"/><label for="check4">Other</label></td>
                        </tr>
                        <tr>
                            <td><input id="check5" type="checkbox" value="Learning Disabilities" name="option5"/><label for="check5">Learning Disabilities</label></td>
                        </tr>
                    </table>
                    <select name="slct-country">
                        <option value="Select a Country">Select a Country</option>
                    </select><br />
                    <select name="slct-state">
                        <option value="Select a State">Select a State</option>
                    </select>
                    <input id="check6" type="checkbox" value="Include neighboring states" name="option6"/>
                    <label for="check6" class="label6 right">Include neighboring states</label>
                    <input class="fae-go left" type="submit" value="Go"/>
            </div>
        </div>
        <div class="br left">
            <h3>Search by Name</h3>
            <p>Enter the first, middle or last name of the consultant.</p>
            <div class="fae-form2">
                <input type="text" class="search-name-field" />
                <input class="fae-go" type="submit" value="Go"/>
            </div>
        </div>
    </div>
    <div class="bb clear">&nbsp;</div>
</div>
