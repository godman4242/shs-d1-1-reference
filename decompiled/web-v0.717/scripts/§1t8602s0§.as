package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3077")]
   public class §1t8602s0§ extends §1t399s0§
   {
      
      public function §1t8602s0§(param1:String, param2:String = "")
      {
         super();
         if(param2 == "")
         {
            objectName = "Ore Deposit";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         if(_loc3_.length > 1 && _loc3_[1] == "1")
         {
            gotoAndStop(1);
            §1t8501s0§ = false;
            buttonMode = false;
         }
         else if(_loc3_[0] == "100")
         {
            gotoAndStop(§1t70s0§.instance.§1t1163s0§(§1t1525s0§.§1t9935s0§(),true));
         }
         else if(_loc3_[0] == "0" || _loc3_[0] == "")
         {
            gotoAndStop(§1t70s0§.instance.§1t1163s0§(§1t1525s0§.§1t9935s0§(),false));
         }
         else if(_loc3_[0] != "")
         {
            gotoAndStop(int(_loc3_[0]));
         }
         §1t8503s0§ = §1t407s0§.§1t12460s0§;
      }
      
      override public function interact() : *
      {
         if(!§1t8501s0§)
         {
            return;
         }
         if(§1t1523s0§.§1t9714s0§(59) != 13022)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(651),§1t1521s0§.getString(5));
            return;
         }
         if(§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§].§1t535s0§())
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(663),§1t1521s0§.getString(5));
            return;
         }
         var _loc1_:int = currentFrame;
         var _loc2_:int = §1t1523s0§.§1t9714s0§(1022);
         if(_loc1_ == 8 && _loc2_ < 5 || _loc1_ == 7 && _loc2_ < 4 || _loc1_ == 6 && _loc2_ < 3 || _loc1_ == 5 && _loc2_ < 2 || _loc1_ == 3 && _loc2_ < 1)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(650),§1t1521s0§.getString(5));
            return;
         }
         if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9414s0§) < 2)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11497),§1t1521s0§.getString(5));
            return;
         }
         §1t1523s0§.§1t9608s0§(-2);
         §1t1523s0§.§1t9586s0§().§1t4453s0§();
         §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10365s0§);
         if(_loc1_ != 2 && int(Math.random() * 2) != 0)
         {
            §1t406s0§.§1t9190s0§().§1t6574s0§().§1t6399s0§(1,this);
         }
         else
         {
            §1t406s0§.§1t9190s0§().§1t6574s0§().§1t6399s0§(currentFrame,this);
         }
      }
      
      public function clearOre() : *
      {
         gotoAndStop(1);
         §1t1525s0§.§1t9927s0§(objectName);
         §1t406s0§.instance.§1t6440s0§.§1t6344s0§();
         §1t8501s0§ = false;
         buttonMode = false;
      }
      
      override public function §1t6733s0§() : String
      {
         if(currentFrame == 1)
         {
            return §1t1521s0§.getString(652);
         }
         if(currentFrame == 2)
         {
            return §1t1521s0§.getString(653);
         }
         if(currentFrame == 3)
         {
            return §1t1521s0§.getString(654);
         }
         if(currentFrame == 4)
         {
            return §1t1521s0§.getString(655);
         }
         if(currentFrame == 5)
         {
            return §1t1521s0§.getString(656);
         }
         if(currentFrame == 6)
         {
            return §1t1521s0§.getString(657);
         }
         if(currentFrame == 7)
         {
            return §1t1521s0§.getString(658);
         }
         if(currentFrame == 8)
         {
            return §1t1521s0§.getString(659);
         }
         return "";
      }
      
      override public function §1t8517s0§() : int
      {
         return 2;
      }
   }
}

