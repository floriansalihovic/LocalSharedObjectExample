package net.icodeapps.examples.lso {

  import flash.events.IEventDispatcher;

  /**
   * Basic type description for configurable classes.
   */
  public interface IConfigurable extends IEventDispatcher {

    [Bindable("configurationChanged")]
    function get configuration():Configuration;

    function set configuration(value:Configuration):void;
  }
}
