package
{
   import flash.net.NetStream;
   
   public class §1t142s0§
   {
      
      internal static var §1t11518s0§:Array = new Array();
      
      internal var §1t1422s0§:§1t251s0§;
      
      internal var §1t1413s0§:String = "";
      
      internal var §1t2175s0§:NetStream;
      
      internal var latency:int = -1;
      
      internal var §1t2176s0§:§1t81s0§ = null;
      
      public function §1t142s0§()
      {
         super();
         this.§1t1422s0§ = §1t251s0§.instance;
      }
      
      public static function §1t9256s0§(param1:String, param2:§1t81s0§ = null) : §1t142s0§
      {
         var _loc3_:§1t142s0§ = new §1t142s0§();
         _loc3_.§1t1413s0§ = param1;
         _loc3_.§1t2176s0§ = param2;
         §1t11518s0§[param1] = _loc3_;
         return _loc3_;
      }
      
      public static function §1t11519s0§(param1:String) : §1t142s0§
      {
         return §1t11518s0§[param1];
      }
      
      public static function §1t11520s0§(param1:String) : *
      {
         §1t11518s0§[param1] = null;
      }
      
      public function connect() : *
      {
         this.§1t1422s0§.connect(this.§1t1413s0§,this);
      }
      
      public function disconnect() : *
      {
         this.§1t1422s0§.disconnect(this.§1t1413s0§);
         §1t142s0§.§1t11520s0§(this.§1t1413s0§);
      }
      
      public function send(param1:int, param2:Object) : *
      {
         var _loc3_:* = undefined;
         if(this.§1t2175s0§ == null)
         {
            _loc3_ = 0;
            while(_loc3_ < this.§1t1422s0§.§1t2028s0§.peerStreams.length)
            {
               if(this.§1t1422s0§.§1t2028s0§.peerStreams[_loc3_].farID == this.§1t1413s0§)
               {
                  this.§1t2175s0§ = this.§1t1422s0§.§1t2028s0§.peerStreams[_loc3_];
               }
               _loc3_++;
            }
         }
         if(this.§1t2175s0§ != null)
         {
            this.§1t2175s0§.send("processMsg",param1,param2);
         }
      }
      
      internal function §1t2177s0§() : *
      {
         var _loc1_:Object = new Object();
         _loc1_.time = int(new Date().valueOf() % 1000000);
         _loc1_.twoWay = true;
         this.send(§1t251s0§.§1t12095s0§,_loc1_);
      }
      
      public function processMsg(param1:int, param2:Object, param3:String = "") : *
      {
         var _loc4_:Object = null;
         var _loc5_:§1t122s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:§1t99s0§ = null;
         if(param3 != "")
         {
            this.§1t1413s0§ = param3;
         }
         switch(param1)
         {
            case §1t251s0§.§1t12084s0§:
               this.§1t2177s0§();
               break;
            case §1t251s0§.§1t12095s0§:
               _loc4_ = new Object();
               _loc4_.time = param2.time;
               _loc4_.twoWay = param2.twoWay;
               if(!§1t1540s0§.§1t10015s0§())
               {
                  this.send(§1t251s0§.§1t12096s0§,_loc4_);
               }
               break;
            case §1t251s0§.§1t12096s0§:
               this.latency = (int(new Date().valueOf() % 1000000) - param2.time) / 2;
               if(§1t113s0§.instance.§1t5249s0§() > this.latency)
               {
                  §1t113s0§.instance.latency = this.latency;
               }
               if(param2.twoWay)
               {
                  _loc4_ = new Object();
                  _loc4_.latency = this.latency;
                  this.send(§1t251s0§.§1t12097s0§,_loc4_);
               }
               if(this.§1t2176s0§ != null)
               {
                  this.§1t2176s0§.§1t1446s0§();
               }
               break;
            case §1t251s0§.§1t12097s0§:
               this.latency = param2.latency;
               if(§1t113s0§.instance.§1t5249s0§() > this.latency)
               {
                  §1t113s0§.instance.latency = this.latency;
               }
               if(this.§1t2176s0§ != null)
               {
                  this.§1t2176s0§.§1t1446s0§();
               }
               break;
            case §1t251s0§.§1t12088s0§:
               §1t1541s0§.§1t10105s0§(param2.lineArrayStr,param2.nid,param2.posX);
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12089s0§:
               if(!this.§1t1422s0§.§1t3515s0§ && (param2.victim == this.§1t1422s0§.nid || param2.victim == §1t1523s0§.charname))
               {
                  §1t1523s0§.§1t9586s0§().§1t4483s0§(param2.hp,param2.launched,param2.canreject,param2.attacker,param2.effdmg);
               }
               else
               {
                  _loc5_ = §1t1543s0§.§1t10225s0§(param2.victim);
                  if(_loc5_ != null)
                  {
                     _loc5_.§1t4483s0§(param2.hp,param2.launched,param2.canreject,param2.attacker,param2.effdmg);
                  }
               }
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12090s0§:
               _loc5_ = §1t1543s0§.§1t10225s0§(this.§1t1413s0§);
               if(_loc5_ != null)
               {
                  _loc5_.§1t3489s0§(param2.stance);
               }
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12091s0§:
               if(param2.anim == "fart")
               {
                  §1t88s0§.instance.§1t1512s0§();
               }
               else if(param2.anim == "sadtrombone")
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_sadTrombone");
               }
               else if(param2.anim == "rimshot")
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_rimshot");
               }
               else
               {
                  _loc5_ = §1t1543s0§.§1t10225s0§(this.§1t1413s0§);
                  if(_loc5_ != null)
                  {
                     _loc5_.§1t1557s0§(param2.anim);
                  }
               }
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12094s0§:
               _loc5_ = §1t1543s0§.§1t10225s0§(this.§1t1413s0§);
               if(_loc5_ != null)
               {
                  _loc5_.say(param2.text);
               }
               §1t113s0§.instance.§1t5238s0§(_loc5_.charname,param2.text);
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12092s0§:
               _loc5_ = §1t1543s0§.§1t10225s0§(this.§1t1413s0§);
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.§1t1555s0§() - param2.x;
                  if(_loc6_ * _loc6_ > 160000)
                  {
                     _loc5_.setPosition(param2.x,param2.y);
                  }
                  else
                  {
                     _loc5_.setPosition(_loc5_.§1t1555s0§(),param2.y);
                  }
                  if(param2.facingRight)
                  {
                     _loc5_.§1t1559s0§().§1t5493s0§();
                  }
                  else
                  {
                     _loc5_.§1t1559s0§().§1t5492s0§();
                  }
                  _loc5_.§1t4494s0§();
                  if(param2.actionState == §1t1544s0§.§1t11187s0§ || param2.actionState == §1t1544s0§.§1t11188s0§)
                  {
                     _loc5_.§1t4436s0§ = int(param2.anim);
                     _loc5_.§1t3269s0§(param2.actionState);
                  }
                  else
                  {
                     if(param2.anim != "")
                     {
                        _loc5_.§1t1557s0§(param2.anim);
                     }
                     _loc5_.§1t3269s0§(param2.actionState);
                  }
               }
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12093s0§:
               §1t1712s0§.§1t4568s0§(param2.ptype,param2.x,param2.y,param2.velX,param2.velY,param2.damage,param2.skilllevel,§1t1543s0§.§1t3306s0§(this.§1t1413s0§));
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12099s0§:
               if(!this.§1t1422s0§.§1t3515s0§ && param2.victim == this.§1t1422s0§.nid)
               {
                  _loc7_ = §1t1523s0§.§1t9586s0§();
                  if(!_loc7_.§1t2364s0§())
                  {
                     _loc7_.§1t4486s0§(param2.damagestr,param2.attacker);
                  }
               }
               else
               {
                  _loc5_ = §1t1543s0§.§1t10225s0§(param2.victim);
                  if(_loc5_ != null)
                  {
                     _loc5_.§1t4486s0§(param2.damagestr,param2.attacker);
                  }
               }
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12100s0§:
               _loc5_ = §1t1543s0§.§1t10225s0§(param2.victim);
               if(_loc5_ != null)
               {
                  _loc5_.§1t4485s0§(param2.hp,param2.launched,param2.attacker);
               }
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
               break;
            case §1t251s0§.§1t12101s0§:
               _loc5_ = §1t1543s0§.§1t10225s0§(param2.victim);
               if(_loc5_ != null)
               {
                  _loc5_.§1t4484s0§(param2.§1t13194s0§);
               }
               if(this.§1t1422s0§.§1t3506s0§())
               {
                  this.§1t1422s0§.§1t3508s0§(param1,param2,this.§1t1413s0§);
               }
         }
      }
   }
}

