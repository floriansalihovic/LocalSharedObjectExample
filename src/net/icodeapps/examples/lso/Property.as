package net.icodeapps.examples.lso {

  /**
   * A simple property representation storing a type and a corresponding value.
   */
  [RemoteClass(alias="net.icodeapps.examples.lso.Property")]
  [Bindable]
  public class Property {

    public var name:String = '';

    public var value:* = '';

    public function clone():Object {
      const p:Property = new Property();
      p.name = name;
      p.value = value;
      return p;
    }

    public function equals(o:Object):Boolean {
      const p:Property = o as Property;
      if (!o) {
        return false;
      } else if (this == o) {
        return true;
      } else {
        return o.name == name
            && o.value == value;
      }
    }

    public function toString():String {
      return "[object Property {name:" + name + ", value: " + value + "}]";
    }
  }
}
