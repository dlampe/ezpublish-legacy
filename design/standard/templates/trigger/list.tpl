<h1>{"Trigger list"|i18n("design/standard/trigger")}</h1>

<form action={$module.functions.list.uri|ezurl} method="post" >

<table width="100%" cellspacing="0">
<tr>
    <th align="left">{"Module name"|i18n("design/standard/trigger")}</th>
    <th align="left">{"Function name"|i18n("design/standard/trigger")}</th>
    <th align="left">{"Connect type"|i18n("design/standard/trigger")}</th>
    <th align="left">{"Workflow"|i18n("design/standard/trigger")}</th>
</tr>

{section name=Trigger loop=$possible_triggers sequence=array(bglight,bgdark)}
<tr>
    <td class="{$Trigger:sequence}">{$Trigger:item.module}</td>
    <td class="{$Trigger:sequence}">{$Trigger:item.operation}</td>
    <td class="{$Trigger:sequence}">{$Trigger:item.connect_type}</td>
    <td class="{$Trigger:sequence}">

<select name="WorkflowID_{$Trigger:item.key}">
<option value="-1">{"No workflow"|i18n("design/standard/trigger")}</option>
{section name=Workflow loop=$Trigger:item.allowed_workflows}
<option value="{$Trigger:Workflow:item.id}" {section show=eq($Trigger:Workflow:item.id,$Trigger:item.workflow_id)} selected="selected" {/section}>{$Trigger:Workflow:item.name} 
</option>
{/section}
</select>

</tr>
{/section}

</table>
<input type="submit" name="StoreButton" value="{'Store'|i18n('design/standard/trigger')}" />

</form>
