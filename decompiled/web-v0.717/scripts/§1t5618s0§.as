package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1069")]
   public class §1t5618s0§ extends MovieClip
   {
      
      public var §1t5619s0§:§1t5003s0§;
      
      public var §1t5620s0§:TextField;
      
      public var §1t5621s0§:§1t5000s0§;
      
      public var nameWords:TextField;
      
      public var §1t5284s0§:TextField;
      
      internal var §1t1704s0§:String;
      
      internal var §1t5623s0§:String;
      
      internal var §1t5624s0§:int;
      
      internal var timer:Timer = new Timer(1000);
      
      internal var §1t5625s0§:Boolean = false;
      
      internal var §1t5626s0§:Boolean = false;
      
      internal var §1t2181s0§:Boolean = false;
      
      public function §1t5618s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.nameWords,true);
         §1t1521s0§.§1t9290s0§(this.§1t5620s0§);
      }
      
      public function §1t5004s0§() : void
      {
         this.§1t5619s0§.addEventListener(MouseEvent.CLICK,this.§1t5627s0§);
         this.§1t5619s0§.§1t5004s0§();
         this.§1t5621s0§.addEventListener(MouseEvent.CLICK,this.§1t5628s0§);
         this.§1t5621s0§.§1t5004s0§();
         if(!this.§1t5626s0§)
         {
            this.timer.start();
            this.timer.addEventListener(TimerEvent.TIMER,this.§1t1427s0§);
         }
      }
      
      public function removeEventListeners() : void
      {
         this.§1t5619s0§.removeEventListener(MouseEvent.CLICK,this.§1t5627s0§);
         this.§1t5619s0§.removeEventListeners();
         this.§1t5621s0§.removeEventListener(MouseEvent.CLICK,this.§1t5628s0§);
         this.§1t5621s0§.removeEventListeners();
         if(!this.§1t5626s0§)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.§1t1427s0§);
         }
      }
      
      internal function §1t5627s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.§1t2181s0§)
         {
            this.removeEventListeners();
            §1t251s0§.§1t9190s0§().§1t3473s0§(true,this.§1t1704s0§);
            this.visible = false;
            §1t6477s0§.instance.show(this.§1t1704s0§,false);
         }
         else if(!this.§1t5626s0§)
         {
            this.removeEventListeners();
            §1t251s0§.§1t9190s0§().§1t3472s0§(true,this.§1t1704s0§);
            this.visible = false;
            §1t5565s0§.instance.§1t5600s0§(this.§1t5623s0§,false);
            §1t1623s0§.instance.§1t1641s0§();
         }
         else
         {
            §1t5565s0§.instance.§1t5599s0§();
         }
      }
      
      internal function §1t5628s0§(param1:MouseEvent) : void
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
         }
         this.removeEventListeners();
         this.visible = false;
         if(this.§1t2181s0§)
         {
            §1t251s0§.§1t9190s0§().§1t3473s0§(false,this.§1t1704s0§);
            if(!§1t1540s0§.§1t10014s0§() && this.§1t5625s0§)
            {
               §1t1541s0§.§1t10045s0§();
               §1t406s0§.instance.§1t6614s0§();
            }
         }
         else if(!this.§1t5626s0§)
         {
            §1t251s0§.§1t9190s0§().§1t3472s0§(false,this.§1t1704s0§);
            §1t1623s0§.instance.§1t1642s0§();
            if(!§1t1540s0§.§1t10014s0§() && this.§1t5625s0§)
            {
               §1t1541s0§.§1t10045s0§();
               §1t406s0§.instance.§1t6614s0§();
            }
         }
         else
         {
            §1t5565s0§.instance.§1t5026s0§(null);
            §1t406s0§.instance.§1t6614s0§();
            §1t406s0§.instance.§1t6610s0§();
            §1t1541s0§.§1t10045s0§();
            §1t251s0§.§1t9190s0§().§1t1894s0§();
            if(param1 != null)
            {
               §1t1523s0§.§1t9610s0§(1);
            }
         }
      }
      
      public function §1t5629s0§() : *
      {
         this.§1t5628s0§(null);
      }
      
      public function §1t5006s0§() : *
      {
         this.§1t5628s0§(null);
      }
      
      public function show(param1:Object, param2:String, param3:String) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         this.§1t5626s0§ = false;
         this.§1t2181s0§ = false;
         this.§1t5620s0§.text = §1t1521s0§.getString(177);
         this.§1t5619s0§.§1t5769s0§(§1t1521s0§.getString(178));
         this.§1t5621s0§.§1t5769s0§(§1t1521s0§.getString(179));
         §1t5565s0§.instance.§1t5601s0§(param1.charname,param1.charlvl,param1.stats,param1.equip,param1.skills,param1.taunt,param1.stance);
         §1t5565s0§.instance.§1t5612s0§(param3);
         §1t5565s0§.instance.§1t1754s0§(param1.bg);
         this.§1t5625s0§ = §1t1541s0§.inputMode == §1t1541s0§.§1t10084s0§;
         if(!§1t1540s0§.§1t10014s0§() && this.§1t5625s0§)
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.§1t5004s0§();
         this.§1t1704s0§ = param2;
         this.§1t5623s0§ = param3;
         this.nameWords.text = param1.charname + " (" + §1t1521s0§.getString(47,[param1.charlvl]) + ")";
         this.§1t5624s0§ = 10;
         this.§1t5284s0§.text = "10";
         this.visible = true;
         this.§1t5619s0§.visible = true;
      }
      
      public function §1t5630s0§(param1:String, param2:String) : void
      {
         this.§1t2181s0§ = true;
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         this.§1t5626s0§ = false;
         this.§1t5620s0§.text = §1t1521s0§.getString(11080);
         this.§1t5619s0§.§1t5769s0§(§1t1521s0§.getString(178));
         this.§1t5621s0§.§1t5769s0§(§1t1521s0§.getString(179));
         this.§1t5625s0§ = §1t1541s0§.inputMode == §1t1541s0§.§1t10084s0§;
         if(!§1t1540s0§.§1t10014s0§() && this.§1t5625s0§)
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.§1t5004s0§();
         this.§1t1704s0§ = param1;
         this.§1t5623s0§ = param2;
         this.nameWords.text = §1t251s0§.instance.§1t3624s0§(param1);
         this.§1t5624s0§ = 10;
         this.§1t5284s0§.text = "10";
         this.visible = true;
         this.§1t5619s0§.visible = true;
      }
      
      internal function §1t1427s0§(param1:TimerEvent) : *
      {
         --this.§1t5624s0§;
         this.§1t5284s0§.text = this.§1t5624s0§.toString();
         if(this.§1t5624s0§ == 0)
         {
            this.§1t5628s0§(null);
         }
      }
      
      public function §1t5631s0§(param1:String) : *
      {
         if(visible)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_error");
         §1t5565s0§.instance.§1t5598s0§();
         this.§1t5626s0§ = true;
         this.§1t2181s0§ = false;
         if(param1 == "0")
         {
            this.§1t5620s0§.text = §1t1521s0§.getString(468);
         }
         else if(param1 == "2")
         {
            this.§1t5620s0§.text = §1t1521s0§.getString(641);
         }
         else if(param1 == "3")
         {
            this.§1t5620s0§.text = §1t1521s0§.getString(642);
         }
         this.§1t5619s0§.§1t5769s0§(§1t1521s0§.getString(469));
         this.§1t5621s0§.§1t5769s0§(§1t1521s0§.getString(470));
         this.§1t5284s0§.text = "";
         this.§1t5004s0§();
         this.nameWords.text = §1t5565s0§.instance.§1t5579s0§ + " (" + §1t1521s0§.getString(47,[§1t5565s0§.instance.§1t5580s0§]) + ")";
         this.visible = true;
         this.§1t5625s0§ = false;
      }
   }
}

