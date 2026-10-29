package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3460")]
   public class §1t5344s0§ extends MovieClip
   {
      
      public var chardeleteform:§1t5331s0§;
      
      public var gobackbutton:§1t5334s0§;
      
      public var slot0:MovieClip;
      
      public var slot1:MovieClip;
      
      public var slot2:MovieClip;
      
      public var §1t5021s0§:TextField;
      
      public function §1t5344s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.slot0.inside);
         §1t1521s0§.§1t9290s0§(this.slot0.insidelevel);
         this.slot0.inside.text = "";
         §1t1521s0§.§1t9290s0§(this.slot1.inside);
         §1t1521s0§.§1t9290s0§(this.slot1.insidelevel);
         this.slot1.inside.text = "";
         §1t1521s0§.§1t9290s0§(this.slot2.inside);
         §1t1521s0§.§1t9290s0§(this.slot2.insidelevel);
         this.slot2.inside.text = "";
         this.slot0.§1t15966s0§.visible = false;
         this.slot1.§1t15966s0§.visible = false;
         this.slot2.§1t15966s0§.visible = false;
         this.chardeleteform.visible = false;
         this.gobackbutton.§1t5769s0§(§1t1521s0§.getString(9));
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(46);
      }
      
      public function §1t5339s0§() : *
      {
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.gobackbutton.§1t5004s0§();
      }
      
      internal function §1t5340s0§() : *
      {
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.gobackbutton.removeEventListeners();
         this.slot0.removeEventListener(MouseEvent.CLICK,this.§1t5351s0§);
         this.slot1.removeEventListener(MouseEvent.CLICK,this.§1t5351s0§);
         this.slot2.removeEventListener(MouseEvent.CLICK,this.§1t5351s0§);
         this.slot0.§1t15966s0§.removeEventListener(MouseEvent.CLICK,this.§1t5350s0§);
         this.slot1.§1t15966s0§.removeEventListener(MouseEvent.CLICK,this.§1t5350s0§);
         this.slot2.§1t15966s0§.removeEventListener(MouseEvent.CLICK,this.§1t5350s0§);
         this.slot0.button.removeEventListener(MouseEvent.CLICK,this.§1t5352s0§);
         this.slot1.button.removeEventListener(MouseEvent.CLICK,this.§1t5353s0§);
         this.slot2.button.removeEventListener(MouseEvent.CLICK,this.§1t5354s0§);
      }
      
      internal function §1t5349s0§() : *
      {
         var _loc3_:Array = null;
         §1t7017s0§.instance.§1t7039s0§();
         var _loc1_:Array = §1t3317s0§.instance.§1t1837s0§.split("|");
         var _loc2_:* = _loc1_.length;
         if(_loc1_[0])
         {
            _loc3_ = _loc1_[0].split(",");
            this.slot0.inside.text = _loc3_[0];
            this.slot0.insidelevel.text = §1t1521s0§.getString(47,[_loc3_[1]]);
            this.slot0.button.addEventListener(MouseEvent.CLICK,this.§1t5352s0§);
            this.slot0.§1t15966s0§.visible = true;
            this.slot0.§1t15966s0§.addEventListener(MouseEvent.CLICK,this.§1t5350s0§);
            if(§1t1523s0§.§1t9487s0§ || §1t3317s0§.instance.§1t1833s0§)
            {
               this.§1t5352s0§(null);
               return;
            }
         }
         else
         {
            this.slot0.inside.text = §1t1521s0§.getString(48);
            this.slot0.insidelevel.text = §1t1521s0§.getString(39);
            this.slot0.addEventListener(MouseEvent.CLICK,this.§1t5351s0§);
            this.slot0.§1t15966s0§.visible = false;
            if(§1t1523s0§.§1t9487s0§ || §1t3317s0§.instance.§1t1833s0§)
            {
               this.§1t5351s0§(null);
               return;
            }
         }
         if(_loc1_[1])
         {
            _loc3_ = _loc1_[1].split(",");
            this.slot1.inside.text = _loc3_[0];
            this.slot1.insidelevel.text = §1t1521s0§.getString(47,[_loc3_[1]]);
            this.slot1.button.addEventListener(MouseEvent.CLICK,this.§1t5353s0§);
            this.slot1.§1t15966s0§.visible = true;
            this.slot1.§1t15966s0§.addEventListener(MouseEvent.CLICK,this.§1t5350s0§);
         }
         else if(§1t1523s0§.§1t9487s0§)
         {
            this.slot1.inside.text = §1t1521s0§.getString(49);
            this.slot1.insidelevel.text = "";
            this.slot1.§1t15966s0§.visible = false;
         }
         else
         {
            this.slot1.inside.text = §1t1521s0§.getString(48);
            this.slot1.insidelevel.text = §1t1521s0§.getString(39);
            this.slot1.addEventListener(MouseEvent.CLICK,this.§1t5351s0§);
            this.slot1.§1t15966s0§.visible = false;
         }
         if(_loc1_[2])
         {
            _loc3_ = _loc1_[2].split(",");
            this.slot2.inside.text = _loc3_[0];
            this.slot2.insidelevel.text = §1t1521s0§.getString(47,[_loc3_[1]]);
            this.slot2.button.addEventListener(MouseEvent.CLICK,this.§1t5354s0§);
            this.slot2.§1t15966s0§.visible = true;
            this.slot2.§1t15966s0§.addEventListener(MouseEvent.CLICK,this.§1t5350s0§);
         }
         else if(§1t1523s0§.§1t9487s0§)
         {
            this.slot2.inside.text = §1t1521s0§.getString(49);
            this.slot2.insidelevel.text = "";
            this.slot2.§1t15966s0§.visible = false;
         }
         else
         {
            this.slot2.inside.text = §1t1521s0§.getString(48);
            this.slot2.insidelevel.text = §1t1521s0§.getString(39);
            this.slot2.addEventListener(MouseEvent.CLICK,this.§1t5351s0§);
            this.slot2.§1t15966s0§.visible = false;
         }
         §1t7017s0§.instance.§1t7040s0§();
      }
      
      internal function §1t5350s0§(param1:MouseEvent) : *
      {
         var _loc3_:Array = null;
         this.§1t5340s0§();
         var _loc2_:Array = §1t3317s0§.instance.§1t1837s0§.split("|");
         _loc3_ = _loc2_[param1.currentTarget.parent.name.substr(4,1)].split(",");
         this.chardeleteform.§1t5339s0§(_loc3_[0]);
         this.chardeleteform.visible = true;
      }
      
      internal function §1t5341s0§(param1:MouseEvent) : *
      {
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7034s0§();
      }
      
      internal function §1t5351s0§(param1:MouseEvent) : *
      {
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7038s0§();
      }
      
      internal function §1t5352s0§(param1:MouseEvent) : *
      {
         §1t1523s0§.charname = this.slot0.inside.text;
         this.§1t5355s0§();
      }
      
      internal function §1t5353s0§(param1:MouseEvent) : *
      {
         §1t1523s0§.charname = this.slot1.inside.text;
         this.§1t5355s0§();
      }
      
      internal function §1t5354s0§(param1:MouseEvent) : *
      {
         §1t1523s0§.charname = this.slot2.inside.text;
         this.§1t5355s0§();
      }
      
      internal function §1t5355s0§() : *
      {
         this.§1t5340s0§();
         §1t1540s0§.§1t10032s0§();
         if(!§1t1540s0§.§1t10062s0§())
         {
            §1t1623s0§.instance.§1t1635s0§();
         }
         else
         {
            §1t1623s0§.instance.§1t1636s0§();
         }
      }
      
      public function §1t5356s0§() : *
      {
         this.slot0.click();
      }
   }
}

