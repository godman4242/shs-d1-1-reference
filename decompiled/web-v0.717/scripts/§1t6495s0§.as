package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3294")]
   public class §1t6495s0§ extends MovieClip
   {
      
      public static var instance:§1t6495s0§;
      
      public var §1t7718s0§:§1t5038s0§;
      
      public var line:§1t4560s0§;
      
      public var §1t7719s0§:TextField;
      
      internal var §1t7720s0§:int;
      
      public function §1t6495s0§()
      {
         super();
         instance = this;
         visible = false;
         this.§1t7718s0§.stop();
         this.§1t7718s0§.arrow.arrowtext.text = "";
      }
      
      public function §1t1028s0§() : int
      {
         return this.§1t7720s0§;
      }
      
      public function §1t1023s0§(param1:int) : *
      {
         this.§1t7720s0§ = param1;
         if(param1 > 0)
         {
            visible = true;
         }
         this.§1t7719s0§.text = "";
         this.§1t7718s0§.visible = true;
         this.line.visible = false;
         this.§1t7718s0§.scaleY = 1;
         switch(param1)
         {
            case 0:
               visible = false;
               this.§1t7718s0§.stop();
               break;
            case 1:
               this.§1t7719s0§.text = §1t1521s0§.getString(628);
               this.§1t7718s0§.visible = false;
               this.line.visible = true;
               break;
            case 2:
               this.§1t7718s0§.x = 345;
               this.§1t7718s0§.y = 390;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(631);
               break;
            case 3:
               this.§1t7718s0§.x = 420;
               this.§1t7718s0§.y = 390;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(81);
               break;
            case 4:
               this.§1t7718s0§.x = 490;
               this.§1t7718s0§.y = 390;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(60);
               this.§1t7718s0§.scaleY = 1;
               break;
            case 5:
               this.§1t7718s0§.x = 55;
               this.§1t7718s0§.y = 390;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(208);
               break;
            case 6:
               this.§1t7718s0§.x = 75;
               this.§1t7718s0§.y = 80;
               this.§1t7718s0§.scaleY = -1;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = "";
               break;
            case 7:
               this.§1t7718s0§.x = 570;
               this.§1t7718s0§.y = 390;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(633);
               this.§1t7718s0§.scaleY = 1;
               break;
            case 8:
               this.§1t7718s0§.x = 610;
               this.§1t7718s0§.y = 121;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(11076);
               this.§1t7718s0§.scaleY = 1;
               break;
            case 9:
               this.§1t7718s0§.x = 330;
               this.§1t7718s0§.y = 70;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(70);
               this.§1t7718s0§.scaleY = 1;
               break;
            case 10:
               visible = false;
               break;
            case 11:
               if(§1t1523s0§.§1t9714s0§(30018) - §1t3317s0§.instance.§1t1847s0§() < 0)
               {
                  §1t406s0§.instance.§1t5799s0§();
               }
               visible = false;
               this.§1t7720s0§ = 0;
               break;
            case 12:
               this.§1t7718s0§.x = 345;
               this.§1t7718s0§.y = 390;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(707);
               break;
            case 13:
               this.§1t7718s0§.scaleY = -1;
               this.§1t7718s0§.x = 77;
               this.§1t7718s0§.y = 72;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = "";
               break;
            case 14:
               this.§1t7718s0§.scaleY = -1;
               this.§1t7718s0§.x = 710;
               this.§1t7718s0§.y = 240;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = "";
               break;
            case 15:
               this.§1t7718s0§.x = 557;
               this.§1t7718s0§.y = 70;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(11077);
               this.§1t7718s0§.scaleY = 1;
               break;
            case 16:
               this.§1t7718s0§.x = 735;
               this.§1t7718s0§.y = 70;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(11078);
               this.§1t7718s0§.scaleY = 1;
               break;
            case 17:
               this.§1t7718s0§.x = 735;
               this.§1t7718s0§.y = 120;
               this.§1t7718s0§.play();
               this.§1t7718s0§.arrow.arrowtext.text = §1t1521s0§.getString(11079);
               this.§1t7718s0§.scaleY = 1;
         }
      }
   }
}

