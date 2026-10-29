package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import playerio.§1t150s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3438")]
   public class §1t5771s0§ extends MovieClip
   {
      
      public var emailfield:TextField;
      
      public var emaillabel:TextField;
      
      public var errormessage:TextField;
      
      public var §1t5772s0§:TextField;
      
      public var submitButton:§1t5334s0§;
      
      internal var username:String;
      
      internal var password:String;
      
      internal var client:§1t150s0§;
      
      public function §1t5771s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.emaillabel);
         §1t1521s0§.§1t9290s0§(this.§1t5772s0§);
         this.emaillabel.text = §1t1521s0§.getString(15);
         this.submitButton.§1t5769s0§(§1t1521s0§.getString(5));
         §1t1521s0§.§1t9290s0§(this.errormessage);
         this.errormessage.text = "";
      }
      
      public function show(param1:String, param2:String, param3:§1t150s0§) : *
      {
         §1t7017s0§.instance.§1t7040s0§();
         §1t7017s0§.instance.login.visible = false;
         visible = true;
         this.username = param1;
         this.password = param2;
         this.client = param3;
         this.§1t5773s0§();
      }
      
      public function §1t5773s0§() : *
      {
         this.submitButton.addEventListener(MouseEvent.CLICK,this.submitAndVerify);
      }
      
      internal function §1t5340s0§() : *
      {
         this.submitButton.removeEventListener(MouseEvent.CLICK,this.submitAndVerify);
      }
      
      internal function submitAndVerify(param1:MouseEvent) : *
      {
         if(this.emailfield.text == "")
         {
            this.errormessage.text = §1t1521s0§.getString(18);
         }
         else if(!this.isValidEmail())
         {
            this.errormessage.text = §1t1521s0§.getString(20);
         }
         else
         {
            this.§1t5340s0§();
            §1t7017s0§.instance.§1t7039s0§();
            visible = false;
         }
      }
      
      internal function isValidEmail() : Boolean
      {
         var _loc1_:String = this.emailfield.text;
         var _loc2_:Array = _loc1_.split("@",3);
         if(_loc2_.length != 2)
         {
            return false;
         }
         if(_loc2_[0] == "" || _loc2_[1] == "")
         {
            return false;
         }
         if(_loc2_[1].split(".",2).length < 2)
         {
            return false;
         }
         if(_loc2_[1].split(".",2)[0] == "" || _loc2_[1].split(".",2)[1] == "")
         {
            return false;
         }
         return true;
      }
   }
}

