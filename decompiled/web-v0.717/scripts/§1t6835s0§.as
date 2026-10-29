package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3469")]
   public class §1t6835s0§ extends MovieClip
   {
      
      public var emailfield:TextField;
      
      public var emaillabel:TextField;
      
      public var errormessage:TextField;
      
      public var gobackbutton:§1t5334s0§;
      
      public var sendemail:§1t5334s0§;
      
      public var §1t5021s0§:TextField;
      
      public function §1t6835s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(50);
         §1t1521s0§.§1t9290s0§(this.emaillabel);
         this.emaillabel.text = §1t1521s0§.getString(15);
         this.sendemail.§1t5769s0§(§1t1521s0§.getString(51));
         this.gobackbutton.§1t5769s0§(§1t1521s0§.getString(9));
      }
      
      public function §1t5339s0§() : *
      {
         this.sendemail.addEventListener(MouseEvent.CLICK,this.§1t6151s0§);
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.sendemail.§1t5004s0§();
         this.gobackbutton.§1t5004s0§();
      }
      
      internal function §1t5340s0§() : *
      {
         this.sendemail.removeEventListener(MouseEvent.CLICK,this.§1t6151s0§);
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.sendemail.removeEventListeners();
         this.gobackbutton.removeEventListeners();
      }
      
      internal function §1t6151s0§(param1:MouseEvent) : *
      {
         if(!this.isValidEmail())
         {
            this.errormessage.text = §1t1521s0§.getString(20);
         }
         else
         {
            this.errormessage.text = "";
            this.§1t5340s0§();
            §1t7017s0§.instance.§1t7039s0§();
            §1t3317s0§.instance.§1t1866s0§(this.emailfield.text);
         }
      }
      
      public function §1t5343s0§(param1:*) : int
      {
         switch(param1)
         {
            case 0:
            case 1:
               §1t7017s0§.instance.login.§1t6142s0§.visible = true;
               §1t7017s0§.instance.login.§1t6144s0§.visible = true;
               §1t7017s0§.instance.§1t7030s0§();
               return 0;
            case 2:
            case 3:
               §1t7017s0§.instance.§1t7040s0§();
               this.§1t5339s0§();
               this.errormessage.text = §1t1521s0§.getString(24);
               return 0;
         }
         §1t7017s0§.instance.§1t7040s0§();
         this.§1t5339s0§();
         this.errormessage.text = §1t1521s0§.getString(52);
         return 0;
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
      
      internal function §1t5341s0§(param1:MouseEvent) : *
      {
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7030s0§();
      }
   }
}

