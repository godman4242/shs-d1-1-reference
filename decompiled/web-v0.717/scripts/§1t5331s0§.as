package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3459")]
   public class §1t5331s0§ extends MovieClip
   {
      
      public var errormessage:TextField;
      
      public var gobackbutton:§1t5334s0§;
      
      public var prompt:TextField;
      
      public var submitbutton:§1t5337s0§;
      
      internal var §1t5338s0§:String;
      
      public function §1t5331s0§()
      {
         super();
         this.gobackbutton.§1t5769s0§(§1t1521s0§.getString(0));
         this.submitbutton.§1t5769s0§(§1t1521s0§.getString(1));
         §1t1521s0§.§1t9290s0§(this.prompt);
         this.prompt.text = §1t1521s0§.getString(2);
      }
      
      public function §1t5339s0§(param1:String) : *
      {
         this.§1t5338s0§ = param1;
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.submitbutton.addEventListener(MouseEvent.CLICK,this.§1t5342s0§);
         this.gobackbutton.§1t5004s0§();
         this.submitbutton.§1t5004s0§();
         this.errormessage.text = "";
         this.prompt.text = §1t1521s0§.getString(2,[param1]);
      }
      
      internal function §1t5340s0§() : *
      {
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.submitbutton.removeEventListener(MouseEvent.CLICK,this.§1t5342s0§);
         this.gobackbutton.removeEventListeners();
         this.submitbutton.removeEventListeners();
      }
      
      internal function §1t5341s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t5340s0§();
         visible = false;
         if(!§1t1523s0§.§1t9487s0§)
         {
            §1t7017s0§.instance.§1t7037s0§();
         }
         else
         {
            §1t7017s0§.instance.§1t7035s0§();
         }
      }
      
      internal function §1t5342s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7039s0§();
         §1t3317s0§.instance.§1t1872s0§(this.§1t5338s0§);
         §1t7017s0§.instance.options.§1t6411s0§.visible = false;
         visible = false;
      }
      
      internal function §1t5343s0§(param1:*) : *
      {
         switch(param1)
         {
            case 0:
               §1t7017s0§.instance.§1t7040s0§();
               if(!§1t1523s0§.§1t9487s0§)
               {
                  §1t7017s0§.instance.§1t7037s0§();
               }
               else
               {
                  §1t7017s0§.instance.§1t7035s0§();
               }
               §1t1540s0§.§1t10031s0§();
               §1t1623s0§.instance.§1t1626s0§();
               break;
            case 1:
            case 2:
            case 3:
               this.§1t5339s0§(this.§1t5338s0§);
               §1t7017s0§.instance.§1t7040s0§();
               this.errormessage.text = §1t1521s0§.getString(43);
               if(!§1t1523s0§.§1t9487s0§)
               {
                  §1t7017s0§.instance.§1t7037s0§();
               }
               else
               {
                  §1t7017s0§.instance.§1t7035s0§();
               }
               visible = true;
               break;
            case 4:
            default:
               this.§1t5339s0§(this.§1t5338s0§);
               §1t7017s0§.instance.§1t7040s0§();
               this.errormessage.text = §1t1521s0§.getString(24);
               visible = true;
         }
      }
   }
}

