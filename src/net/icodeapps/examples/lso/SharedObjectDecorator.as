package net.icodeapps.examples.lso {

  import flash.net.SharedObject;
  import flash.utils.getQualifiedClassName;

  import mx.core.FlexGlobals;
  import mx.core.IMXMLObject;

  import net.icodeapps.examples.lso.events.ConfigurationEvent;

  /**
   * Simple decorator providing an easy access to a global functionality.
   */
  public class SharedObjectDecorator implements IMXMLObject {

    /**
     * The instance to be configured.
     */
    private var _configurable:IConfigurable;

    /**
     * @inheritDoc
     */
    public function initialized(document:Object, id:String):void {
      if (!(document is IConfigurable)) {
        return;
      }

      _configurable = document as IConfigurable;
      _configurable.addEventListener(ConfigurationEvent.SAVE_CONFIGURATION, configurable_saveConfigurationHandler);

      loadConfiguration();
    }

    /**
     * Loading the configuration from the local shared object. If it does not exist, a new instance will be created
     * and set.
     */
    private function loadConfiguration():void {
      const sharedObject:SharedObject = SharedObject.getLocal(getQualifiedClassName(FlexGlobals.topLevelApplication));
      if (sharedObject.data.configuration) {
        _configurable.configuration = sharedObject.data.configuration as Configuration;
      } else {
        _configurable.configuration = new Configuration();
      }
    }

    /**
     * Writes the current configuration into the local shared object.
     */
    private function saveConfiguration():void {
      const sharedObject:SharedObject = SharedObject.getLocal(getQualifiedClassName(FlexGlobals.topLevelApplication));
      sharedObject.data.configuration = _configurable.configuration;
      sharedObject.flush();
    }

    /**
     * Invoked when the @configurable (the top level application) dispatches a ConfigurationEvent.
     * @param event The event being dispatched.
     */
    private function configurable_saveConfigurationHandler(event:ConfigurationEvent):void {
      saveConfiguration();
    }
  }
}
