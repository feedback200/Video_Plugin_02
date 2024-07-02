{**
 * settings.tpl
 * Template file for plugin settings
 *}


<form class="pkp_form" id="videoJsViewerSettingsForm" method="post" action="{url op="save"}">
    {csrf}
    <fieldset>
        <legend>{translate key="plugins.generic.videoJsViewer.name"}</legend>

        <div class="pkp_form_section">
            <label for="showVideoDirectly">{translate key="plugins.generic.videoJsViewer.showVideoDirectly"}</label>
            <input type="checkbox" id="showVideoDirectly" name="showVideoDirectly" {if $showVideoDirectly}checked{/if}>
        </div>

        <div class="pkp_form_buttons">
            <button type="submit" class="pkp_button_primary">{translate key="common.save"}</button>
            <button type="button" class="pkp_button" onclick="window.location.href='{url op="index"}'">{translate key="common.cancel"}</button>
        </div>
    </fieldset>
</form>
