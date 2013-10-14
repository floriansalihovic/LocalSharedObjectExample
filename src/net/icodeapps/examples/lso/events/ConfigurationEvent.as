package net.icodeapps.examples.lso.events {

  import flash.events.Event;

  /**
   * Dedicated event which is dispatched to invoke the writing of the global configuration.
   */
  public class ConfigurationEvent extends Event {

    public static const SAVE_CONFIGURATION:String = "saveConfiguration";

    public function ConfigurationEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
    }

    /**
     * @inheritDoc
     */
    override public function clone():Event {
      return new ConfigurationEvent(type, bubbles, cancelable);
    }
  }
}
