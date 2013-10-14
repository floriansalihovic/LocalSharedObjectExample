package net.icodeapps.examples.lso {

  import mx.collections.ArrayCollection;
  import mx.collections.IList;

  /**
   * A basic configuration which is used in the entire application.
   */
  [RemoteClass(alias="net.icodeapps.examples.lso.Configuration")]
  [Bindable]
  public class Configuration {

    public var dataStore:IList;

    public function Configuration() {
      dataStore = new ArrayCollection();
    }
  }
}
