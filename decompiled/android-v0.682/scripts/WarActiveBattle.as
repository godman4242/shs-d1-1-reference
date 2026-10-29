package
{
   public class WarActiveBattle
   {
      
      public static var MAPSTATE_DISABLED:int = 0;
      
      public static var MAPSTATE_ENABLED:int = 1;
      
      public static var MAPSTATE_INCOMING:int = 2;
      
      public static var MAPSTATE_OUTGOING:int = 3;
      
      internal var mapid:int;
      
      internal var states:IntMap;
      
      internal var mapactive:Boolean = false;
      
      internal var flagside:int = 0;
      
      internal var showflag:Boolean = false;
      
      public var territoryY:int;
      
      public function WarActiveBattle(mapid:int)
      {
         super();
         this.states = new IntMap();
         this.mapid = mapid;
         this.territoryY = (mapid & 0x0FFF) - 341 + WarSelectUI.TERRSHIFTY;
      }
      
      public function setState(side:int, state:int, xpos:int, ypos:int) : *
      {
         var sideArray:Array = null;
         if(!this.states.contains(side))
         {
            sideArray = new Array();
            sideArray.push(new WarSpawnPoint(state,xpos,ypos));
            this.states.put(side,sideArray);
         }
         else
         {
            this.updateState(side,state,xpos,ypos);
         }
         var playerside:int = StatsManager.getSide();
         if(side == playerside && state != MAPSTATE_DISABLED)
         {
            this.showflag = true;
         }
         if(state == MAPSTATE_ENABLED || state == MAPSTATE_OUTGOING)
         {
            this.mapactive = true;
            this.showflag = true;
         }
         if(this.flagside != playerside)
         {
            this.flagside = side;
         }
      }
      
      public function updateState(side:int, state:int, xpos:int, ypos:int) : *
      {
         var max:int = 0;
         var spawnPoint:WarSpawnPoint = null;
         var i:int = 0;
         var sideArray:Array = this.states.get(side);
         if(sideArray == null)
         {
            this.setState(side,state,xpos,ypos);
         }
         else
         {
            max = int(sideArray.length);
            spawnPoint = null;
            for(i = 0; i < max; i++)
            {
               spawnPoint = sideArray[i];
               if(spawnPoint.xpos == xpos && spawnPoint.ypos == ypos)
               {
                  spawnPoint.state = state;
                  return;
               }
            }
            sideArray.push(new WarSpawnPoint(state,xpos,ypos));
         }
      }
      
      public function getMapId() : int
      {
         return this.mapid;
      }
      
      public function isShowFlag() : Boolean
      {
         return this.showflag;
      }
      
      public function isMapActive() : Boolean
      {
         return this.mapactive;
      }
      
      public function getState(side:int, xpos:int, ypos:int) : int
      {
         var sideArray:Array = this.states.get(side);
         if(sideArray == null)
         {
            return 0;
         }
         var max:int = int(sideArray.length);
         for(var i:int = 0; i < max; i++)
         {
            if(sideArray[i].xpos == xpos && sideArray[i].ypos == ypos)
            {
               return sideArray[i].state;
            }
         }
         return 0;
      }
      
      public function getAllSidesState(xpos:int, ypos:int) : IntStat
      {
         var sideArray:Array = null;
         var max:int = 0;
         var i:int = 0;
         var keys:Array = this.states.getKeys();
         var values:Array = this.states.getValues();
         var keysmax:int = int(keys.length);
         for(var j:int = 0; j < keysmax; j++)
         {
            sideArray = values[j];
            max = int(sideArray.length);
            for(i = 0; i < max; i++)
            {
               if(sideArray[i].xpos == xpos && sideArray[i].ypos == ypos)
               {
                  return new IntStat(keys[j],sideArray[i].state);
               }
            }
         }
         return new IntStat(0,0);
      }
      
      public function getSideState(side:int) : *
      {
         var hasOutgoing:Boolean = false;
         var hasIncoming:Boolean = false;
         var sideArray:Array = this.states.get(side);
         if(sideArray == null)
         {
            return 0;
         }
         var max:int = int(sideArray.length);
         for(var i:int = 0; i < max; i++)
         {
            if(sideArray[i].state == 1)
            {
               return 1;
            }
            if(sideArray[i].state == 3)
            {
               hasOutgoing = true;
            }
            else if(sideArray[i].state == 2)
            {
               hasIncoming = true;
            }
         }
         if(hasOutgoing && hasIncoming)
         {
            return 1;
         }
         if(hasIncoming)
         {
            return 2;
         }
         if(hasOutgoing)
         {
            return 3;
         }
         return 0;
      }
      
      public function getFlagSide() : int
      {
         return this.flagside;
      }
      
      public function getCustomClansInvolved() : Array
      {
         var clanId:int = 0;
         var keys:Array = this.states.getKeys();
         var output:Array = new Array();
         var max:int = int(keys.length);
         for(var i:int = 0; i < max; i++)
         {
            clanId = int(keys[i]);
            if(StatsManager.isCustomClan(clanId) && !QueryManagerPIO.instance.hasCustomClanData(clanId))
            {
               output.push(clanId.toString());
            }
         }
         return output;
      }
      
      public function toString() : String
      {
         var sideArray:Array = null;
         var max:int = 0;
         var i:int = 0;
         var keys:Array = this.states.getKeys();
         var values:Array = this.states.getValues();
         var keysmax:int = int(keys.length);
         var str:String = "";
         for(var j:int = 0; j < keysmax; j++)
         {
            sideArray = values[j];
            max = int(sideArray.length);
            for(i = 0; i < max; i++)
            {
               str += this.mapid + "," + keys[j] + "," + sideArray[i].state + "," + sideArray[i].xpos + "," + sideArray[i].ypos + "|";
            }
         }
         return str;
      }
   }
}

