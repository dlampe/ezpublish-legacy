<div class="block">
{foreach $diff.changes as $change}
    {if eq( $change.status, 0 )}
        {$change.unchanged|wash( xhtml )|break()}
    {elseif eq( $change.status, 1 )}
        <del>{$change.removed|wash( xhtml )|break()}</del>
    {elseif eq( $change.status, 2 )}
        <ins>{$change.added|wash( xhtml )|break()}</ins>
    {/if}
{/foreach}
</div>
