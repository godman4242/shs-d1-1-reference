package
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class §1t3646s0§ extends §1t80s0§
   {
      
      internal var §1t3647s0§:XMLList;
      
      internal var timer:Timer;
      
      internal var §1t3648s0§:int;
      
      internal var §1t3649s0§:Number;
      
      public function §1t3646s0§(param1:XML)
      {
         super();
         type = "cutscene";
         this.§1t3647s0§ = XMLList(param1.data).copy();
      }
      
      public function §1t3650s0§() : *
      {
         this.timer = new Timer(100);
         this.timer.addEventListener(TimerEvent.TIMER,this.§1t3651s0§);
         this.§1t3648s0§ = 0;
         this.§1t3649s0§ = 0;
         this.timer.start();
         this.§1t3651s0§(null);
      }
      
      internal function §1t3651s0§(param1:Event) : *
      {
         var _loc2_:§1t379s0§ = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         while(this.§1t3649s0§ <= this.timer.currentCount / 10)
         {
            _loc3_ = this.§1t3647s0§[this.§1t3648s0§];
            if(_loc3_.action == "create")
            {
               _loc4_ = 400;
               if(_loc3_.y.toString() != "")
               {
                  _loc4_ = int(_loc3_.y);
               }
               §1t1525s0§.§1t9940s0§().§1t3537s0§(41,_loc3_.x,_loc4_,_loc3_.param,_loc3_.id,null,false);
            }
            else if(_loc3_.action == "createobject")
            {
               _loc4_ = 400;
               if(_loc3_.y.toString() != "")
               {
                  _loc4_ = int(_loc3_.y);
               }
               _loc5_ = _loc3_.param.split("|");
               if(_loc5_.length == 2)
               {
                  §1t1525s0§.§1t9940s0§().§1t3537s0§(_loc5_[0],_loc3_.x,_loc4_,_loc5_[1],_loc3_.id,null,false);
               }
            }
            else if(_loc3_.action == "createprojectile")
            {
               _loc5_ = _loc3_.param.split(",");
               _loc6_ = 1;
               if(_loc5_.length > 5)
               {
                  _loc6_ = int(_loc5_[5]);
               }
               §1t1712s0§.§1t4568s0§(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],0,_loc6_,null);
            }
            else if(_loc3_.action == "music")
            {
               §1t1523s0§.§1t9712s0§(111,int(_loc3_.param));
            }
            else if(_loc3_.action == "sound")
            {
               §1t1523s0§.§1t9712s0§(112,int(_loc3_.param));
            }
            else
            {
               if(_loc3_.action == "end")
               {
                  this.§1t3652s0§();
                  return;
               }
               if(_loc3_.id == "player")
               {
                  §1t1523s0§.§1t9586s0§().§1t4511s0§(_loc3_.action,_loc3_.param);
               }
               else
               {
                  _loc2_ = §1t1525s0§.§1t9940s0§().§1t8146s0§(_loc3_.id) as §1t379s0§;
                  if(_loc2_ != null)
                  {
                     _loc2_.§1t4511s0§(_loc3_.action,_loc3_.param);
                  }
               }
            }
            ++this.§1t3648s0§;
            if(this.§1t3648s0§ >= this.§1t3647s0§.length())
            {
               this.§1t3652s0§();
               break;
            }
            this.§1t3649s0§ = Number(this.§1t3647s0§[this.§1t3648s0§].time);
         }
      }
      
      internal function §1t3652s0§() : *
      {
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.§1t3651s0§);
         §1t126s0§.instance.§1t813s0§();
      }
   }
}

