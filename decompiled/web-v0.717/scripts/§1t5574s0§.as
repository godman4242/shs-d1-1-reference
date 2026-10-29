package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1730")]
   public class §1t5574s0§ extends MovieClip
   {
      
      public var §1t5438s0§:§1t5632s0§;
      
      public var duelbutton:§1t5050s0§;
      
      public var onlinetext:TextField;
      
      public var opponentlevel:TextField;
      
      public var opponentname:TextField;
      
      internal var charname:String;
      
      internal var equipment:String;
      
      internal var level:int;
      
      internal var timesince:int;
      
      public function §1t5574s0§()
      {
         super();
         this.duelbutton.§1t5769s0§(§1t1521s0§.getString(57));
         this.onlinetext.text = §1t1521s0§.getString(202);
         §1t1521s0§.§1t9290s0§(this.onlinetext);
         §1t1521s0§.§1t9290s0§(this.opponentname,true);
         §1t1521s0§.§1t9290s0§(this.opponentlevel);
      }
      
      public function setDuelInfo(param1:String, param2:int, param3:String, param4:int) : *
      {
         if(param3 == "")
         {
            param3 = "0|0|6001|0|8006|0|0|0|12000|13002|13002|0|0";
         }
         this.charname = param1;
         this.equipment = param3;
         this.level = param2;
         this.timesince = param4;
         this.visible = true;
         this.opponentname.text = param1;
         this.opponentlevel.text = §1t1521s0§.getString(47,[param2.toString()]);
         this.§1t5438s0§.§1t5491s0§(param3);
         this.onlinetext.visible = param4 < 300;
      }
      
      public function clearSlot() : *
      {
         this.charname = "";
         this.equipment = "";
         this.level = -1;
      }
      
      public function §1t5004s0§() : *
      {
         this.duelbutton.§1t5004s0§();
         this.duelbutton.addEventListener(MouseEvent.CLICK,this.§1t5594s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.duelbutton.removeEventListeners();
         this.duelbutton.removeEventListener(MouseEvent.CLICK,this.§1t5594s0§);
      }
      
      internal function §1t5594s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         §1t5565s0§.instance.§1t5594s0§(this.charname,this.level,this.equipment);
         §1t1623s0§.instance.§1t1627s0§();
      }
   }
}

