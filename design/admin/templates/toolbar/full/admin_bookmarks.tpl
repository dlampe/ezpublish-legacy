<div id="bookmarks">

<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr">{section show=$first}<div class="box-tl"><div class="box-tr">{/section}

{section show=ezpreference( 'admin_bookmark_menu' )}
    {section show=and( ne( $ui_context, 'edit' ), ne( $ui_context, 'browse' ) )}
     <h4><a class="showhide" href={'/user/preferences/set/admin_bookmark_menu/0'|ezurl} title="{'Hide bookmarks.'|i18n( 'design/admin/pagelayout' )}"><span class="bracket">[</span>-<span class="bracket">]</span></a> <a href={'/content/bookmark/'|ezurl} title="{'Manage your personal bookmarks.'|i18n( 'design/admin/pagelayout' )}">{'Bookmarks'|i18n( 'design/admin/pagelayout' )}</a></h4>
    {section-else}
     {section show=eq( $ui_context, 'edit' )}
       <h4><span class="disabled openclose"><span class="bracket">[</span>-<span class="bracket">]</span></span> <span class="disabled">{'Bookmarks'|i18n( 'design/admin/pagelayout' )}</span></h4>
     {section-else}
       <h4><a class="showhide" href={'/user/preferences/set/admin_bookmark_menu/0'|ezurl} title="{'Hide bookmarks.'|i18n( 'design/admin/pagelayout' )}"><span class="bracket">[</span>-<span class="bracket">]</span></a> {'Bookmarks'|i18n( 'design/admin/pagelayout' )}</h4>
     {/section}
    {/section}

</div></div></div></div>{section show=$first}</div></div>{/section}

{section show=$last}
<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">
{section-else}
<div class="box-ml"><div class="box-mr"><div class="box-content">
{/section}

<ul>
{let bookmark_list=fetch( content, bookmarks )}
    {section var=Bookmarks loop=$bookmark_list}
        {section show=ne( $ui_context, 'edit' )}
         <li>
       {section show=ne( $ui_context, 'browse')}
       <a href="#" onclick="ezpopmenu_showTopLevel( event, 'BookmarkMenu', ez_createAArray( new Array( '%nodeID%', '{$Bookmarks.item.node_id}' , '%objectID%', '{$Bookmarks.item.contentobject_id}', '%bookmarkID%', '{$Bookmarks.item.id}' ) ) , '{$Bookmarks.item.name|shorten(18)|wash(javascript)}'); return false;">{$Bookmarks.item.node.object.content_class.identifier|class_icon( small, '[%classname] Click on the icon to get a context sensitive menu.'|i18n( 'design/admin/pagelayout',, hash( '%classname', $Bookmarks.item.node.object.content_class.name  ) ) )}</a>&nbsp;<a href={$Bookmarks.item.node.url_alias|ezurl}>{$Bookmarks.item.node.name|wash}</a></li>
       {section-else}
           {section show=$Bookmarks.item.node.object.content_class.is_container}
               {$Bookmarks.item.node.object.content_class.identifier|class_icon( small, $Bookmarks.item.node.object.content_class.name )}&nbsp;<a href={concat( '/content/browse/', $Bookmarks.item.node.node_id)|ezurl}>{$Bookmarks.item.node.name|wash}</a></li>
           {section-else}
               {$Bookmarks.item.node.object.content_class.identifier|class_icon( small, $Bookmarks.item.node.object.content_class.name )}&nbsp;{$Bookmarks.item.node.name|wash}</li>
           {/section}
       {/section}
     {section-else}
         <li>{$Bookmarks.item.node.object.content_class.identifier|class_icon( ghost, $Bookmarks.item.node.object.content_class.name )}&nbsp;<span class="disabled">{$Bookmarks.item.node.name|wash}</span></li>
         {/section}
    {/section}
{/let}
</ul>

<div class="block">
{* Show "Add to bookmarks" button if we're viewing an actual node. *}
{section show=and( is_set( $module_result.content_info.node_id ), $ui_context|ne( 'edit' ), $ui_context|ne( 'browse' ) )}
<form method="post" action={'content/action'|ezurl}>
<input type="hidden" name="ContentNodeID" value="{$module_result.content_info.node_id}" />
<input class="button" type="submit" name="ActionAddToBookmarks" value="{'Add to bookmarks'|i18n( 'design/admin/pagelayout' )}" title="{'Add the current item to your bookmarks.'|i18n( 'design/admin/pagelayout' )}" />
</form>
{section-else}
<form method="post" action={'content/action'|ezurl}>
<input class="button-disabled" type="submit" value="{'Add to bookmarks'|i18n( 'design/admin/pagelayout' )}" disabled="disabled" />
</form>
{/section}
</div>

</div></div></div>{section show=$last}</div></div></div>{/section}

{section-else}
    {section show=and( ne( $ui_context,'edit' ), ne( $ui_context, 'browse' ) )}
    <h4><a class="showhide" href={'/user/preferences/set/admin_bookmark_menu/1'|ezurl} title="{'Show bookmarks.'|i18n( 'design/admin/pagelayout' )}"><span class="bracket">[</span>+<span class="bracket">]</span></a> <a href={'/content/bookmark/'|ezurl}>{'Bookmarks'|i18n( 'design/admin/pagelayout' )}</a></h4>
    {section-else}
    {section show=eq( $ui_context, 'edit' )}
     <h4><span class="disabled openclose"><span class="bracket">[</span>+<span class="bracket">]</span></span> <span class="disabled">{'Bookmarks'|i18n( 'design/admin/pagelayout' )}</span></h4>
    {section-else}
     <h4><a class="showhide" href={'/user/preferences/set/admin_bookmark_menu/1'|ezurl} title="{'Show bookmarks.'|i18n( 'design/admin/pagelayout' )}"><span class="bracket">[</span>+<span class="bracket">]</span></a> {'Bookmarks'|i18n( 'design/admin/pagelayout' )}</h4>
    {/section}
    {/section}
    
</div></div></div></div>{section show=$first}</div></div>{/section}

{section show=$last}
<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">
</div></div></div></div></div></div>
{/section}

{/section}                       
</div>
