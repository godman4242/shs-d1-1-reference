package
{
   public class §1t114s0§
   {
      
      public static var instance:§1t114s0§;
      
      public static var §1t9962s0§:int = 0;
      
      public static var §1t9963s0§:int = 1;
      
      public static var §1t9964s0§:int = 2;
      
      public static var §1t9965s0§:int = 3;
      
      public static var §1t9966s0§:int = 4;
      
      public static var §1t9967s0§:int = 5;
      
      public static var §1t9968s0§:int = 6;
      
      public static var §1t9969s0§:int = 7;
      
      public static var §1t9970s0§:int = 8;
      
      public static var §1t9971s0§:int = 9;
      
      internal static var §1t9972s0§:int = 10;
      
      internal var §1t1526s0§:Vector.<Boolean> = new Vector.<Boolean>(§1t9972s0§);
      
      internal var §1t1527s0§:Array = new Array();
      
      internal var §1t916s0§:§1t24s0§;
      
      internal var §1t1531s0§:int = -1;
      
      internal var §1t1532s0§:Boolean = false;
      
      public function §1t114s0§()
      {
         super();
         instance = this;
      }
      
      public static function §1t9190s0§() : §1t114s0§
      {
         if(instance == null)
         {
            new §1t114s0§();
         }
         return instance;
      }
      
      public function init(param1:§1t24s0§) : *
      {
         this.§1t916s0§ = param1;
         this.§1t1528s0§();
      }
      
      internal function §1t1528s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t9972s0§)
         {
            this.§1t1526s0§[_loc1_] = false;
            _loc1_++;
         }
      }
      
      internal function §1t1529s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t9972s0§)
         {
            this.§1t1526s0§[_loc1_] = true;
            _loc1_++;
         }
      }
      
      internal function §1t1530s0§(param1:int) : *
      {
         this.§1t1526s0§[param1] = true;
      }
      
      internal function §1t1533s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t9972s0§)
         {
            this.§1t1527s0§[_loc1_] = false;
            _loc1_++;
         }
         this.§1t1531s0§ = -1;
         this.§1t1532s0§ = false;
      }
      
      public function §1t1534s0§() : *
      {
         this.§1t1531s0§ = -1;
         this.§1t1532s0§ = false;
      }
      
      internal function §1t1535s0§(param1:int) : *
      {
         this.§1t1527s0§[param1] = false;
         §1t406s0§.instance.§1t6656s0§(this.§1t1536s0§());
      }
      
      public function §1t1536s0§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t9972s0§)
         {
            if(this.§1t1527s0§[_loc1_])
            {
               return true;
            }
            _loc1_++;
         }
         this.§1t1531s0§ = -1;
         return false;
      }
      
      public function §1t1537s0§() : *
      {
         this.§1t1539s0§();
         §1t251s0§.instance.§1t3542s0§(101,"");
      }
      
      public function §1t1538s0§() : *
      {
         §1t251s0§.instance.§1t3542s0§(100,"");
      }
      
      public function §1t1539s0§() : *
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = undefined;
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            this.§1t1528s0§();
         }
         else
         {
            _loc1_ = false;
            _loc2_ = 0;
            while(_loc2_ < §1t9972s0§)
            {
               if(this.§1t1526s0§[_loc2_])
               {
                  _loc1_ = true;
               }
               _loc2_++;
            }
            if(!_loc1_)
            {
               return;
            }
            if(this.§1t1526s0§[§1t9962s0§])
            {
               this.§1t1526s0§[§1t9962s0§] = false;
               §1t251s0§.instance.§1t3542s0§(0,this.§1t916s0§.§1t646s0§());
            }
            if(this.§1t1526s0§[§1t9963s0§] && !this.§1t1526s0§[§1t9969s0§])
            {
               this.§1t1526s0§[§1t9963s0§] = false;
               §1t251s0§.instance.§1t3542s0§(1,this.§1t916s0§.§1t649s0§());
            }
            if(this.§1t1526s0§[§1t9964s0§])
            {
               this.§1t1526s0§[§1t9964s0§] = false;
               §1t251s0§.instance.§1t3542s0§(2,this.§1t916s0§.§1t651s0§());
            }
            if(this.§1t1526s0§[§1t9965s0§])
            {
               this.§1t1526s0§[§1t9965s0§] = false;
               §1t251s0§.instance.§1t3542s0§(3,this.§1t916s0§.§1t653s0§());
            }
            if(this.§1t1526s0§[§1t9966s0§])
            {
               this.§1t1526s0§[§1t9966s0§] = false;
               §1t251s0§.instance.§1t3542s0§(4,this.§1t916s0§.§1t655s0§());
            }
            if(this.§1t1526s0§[§1t9967s0§])
            {
               this.§1t1526s0§[§1t9967s0§] = false;
               §1t251s0§.instance.§1t3542s0§(5,this.§1t916s0§.§1t657s0§());
            }
            if(this.§1t1526s0§[§1t9968s0§])
            {
               this.§1t1526s0§[§1t9968s0§] = false;
               §1t251s0§.instance.§1t3542s0§(6,this.§1t916s0§.§1t658s0§());
            }
            if(this.§1t1526s0§[§1t9969s0§])
            {
               this.§1t1526s0§[§1t9963s0§] = false;
               this.§1t1526s0§[§1t9969s0§] = false;
               §1t251s0§.instance.§1t3542s0§(7,this.§1t916s0§.§1t648s0§());
            }
            if(this.§1t1526s0§[§1t9970s0§])
            {
               this.§1t1526s0§[§1t9970s0§] = false;
               §1t251s0§.instance.§1t3542s0§(8,this.§1t916s0§.§1t660s0§());
            }
            if(this.§1t1526s0§[§1t9971s0§])
            {
               this.§1t1526s0§[§1t9962s0§] = false;
               this.§1t1526s0§[§1t9971s0§] = false;
               §1t251s0§.instance.§1t3542s0§(0,this.§1t916s0§.§1t645s0§());
            }
         }
      }
   }
}

