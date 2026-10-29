package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3115")]
   public class §1t8596s0§ extends §1t399s0§
   {
      
      public function §1t8596s0§(param1:String, param2:String = "")
      {
         super();
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Farmers\' Market";
         }
         else
         {
            objectName = param2;
         }
         §1t8503s0§ = §1t407s0§.§1t12433s0§;
      }
      
      override public function interact() : *
      {
         §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12350s0§);
      }
      
      override public function §1t6733s0§() : String
      {
         return §1t1521s0§.getString(268);
      }
   }
}

