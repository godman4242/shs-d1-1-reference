package
{
   public class NetworkRecord
   {
      
      internal static var DELIM:String = "^";
      
      internal static var DELIM2:String = "(";
      
      public static var DELIM3:String = ")";
      
      internal var msgType:int;
      
      internal var msg:Object;
      
      internal var sender:String;
      
      internal var time:int;
      
      public function NetworkRecord(msgType:int, msg:Object, sender:String, time:int)
      {
         super();
         this.msgType = msgType;
         this.msg = msg;
         this.sender = sender;
         this.time = time;
      }
      
      public static function parse(str:String) : Array
      {
         var networkRecord:NetworkRecord = null;
         var strArray:Array = null;
         var _time:int = 0;
         var _msgType:int = 0;
         var _sender:String = null;
         var _msg:Object = null;
         var msgArray:Array = null;
         var overallStrArray:Array = str.split(DELIM3);
         var max:int = int(overallStrArray.length);
         var output:Array = new Array();
         for(var i:int = 0; i < max; i++)
         {
            if(overallStrArray[i] == "")
            {
               break;
            }
            strArray = overallStrArray[i].split(DELIM);
            _time = int(strArray[0]);
            _msgType = int(strArray[1]);
            _sender = strArray[2];
            _msg = new Object();
            msgArray = strArray[3].split(DELIM2);
            switch(_msgType)
            {
               case 2:
                  _msg.charname = msgArray[0];
                  _msg.charlvl = msgArray[1];
                  _msg.stats = msgArray[2];
                  _msg.equip = msgArray[3];
                  _msg.skills = msgArray[4];
                  _msg.taunt = msgArray[5];
                  _msg.bg = msgArray[6];
                  _msg.win = msgArray[7] == "1";
                  break;
               case 6:
                  _msg.lineArrayStr = msgArray[0];
                  if(msgArray.length == 1)
                  {
                     _msg.nid = _sender;
                  }
                  else
                  {
                     _msg.nid = msgArray[1];
                  }
                  if(msgArray.length >= 3)
                  {
                     _msg.posX = msgArray[2];
                  }
                  else
                  {
                     _msg.posX = -1;
                  }
                  break;
               case 7:
                  _msg.hp = msgArray[0];
                  _msg.victim = msgArray[1];
                  _msg.launched = msgArray[2];
                  break;
               case 8:
                  _msg.stance = msgArray[0];
                  break;
               case 9:
                  _msg.anim = msgArray[0];
                  break;
               case 10:
                  _msg.actionState = msgArray[0];
                  _msg.x = msgArray[1];
                  _msg.y = msgArray[2];
                  _msg.facingRight = msgArray[3] == "1";
                  if(msgArray.length == 5)
                  {
                     _msg.anim = msgArray[4];
                  }
                  else
                  {
                     _msg.anim = "";
                  }
                  break;
               case 11:
                  _msg.ptype = msgArray[0];
                  _msg.x = msgArray[1];
                  _msg.y = msgArray[2];
                  _msg.velX = msgArray[3];
                  _msg.velY = msgArray[4];
                  _msg.damage = msgArray[5];
                  _msg.skilllevel = msgArray[6];
                  break;
               case 12:
                  _msg.text = msgArray[0];
                  break;
               case 13:
                  _msg.time = msgArray[0];
                  break;
               case 14:
                  _msg.time = msgArray[0];
            }
            networkRecord = new NetworkRecord(_msgType,_msg,_sender,_time);
            output.push(networkRecord);
         }
         return output;
      }
      
      public function getTimeStamp() : int
      {
         return this.time;
      }
      
      public function getMsgType() : int
      {
         return this.msgType;
      }
      
      public function getMsg() : Object
      {
         return this.msg;
      }
      
      public function getSender() : String
      {
         return this.sender;
      }
      
      public function toStr() : String
      {
         var str:String = this.time + " " + this.msgType + " from " + this.sender + " [";
         var msgstr:String = "";
         switch(this.msgType)
         {
            case 2:
               msgstr = "charname:" + this.msg.charname + " charlvl:" + this.msg.charlvl + " stats:" + this.msg.stats + " equip:" + this.msg.equip + " skills:" + this.msg.skills + " taunt:" + this.msg.taunt + " bg:" + this.msg.bg + " win:" + this.msg.win;
               break;
            case 6:
               msgstr = "lineArrayStr:" + this.msg.lineArrayStr + " posX:" + this.msg.posX;
               break;
            case 7:
               msgstr = "hp:" + this.msg.hp + " nid:" + this.msg.victim + " launched:" + this.msg.launched;
               break;
            case 8:
               msgstr = "stance:" + this.msg.stance;
               break;
            case 9:
               msgstr = "anim:" + this.msg.anim;
               break;
            case 10:
               msgstr = "actionState:" + this.msg.actionState + " x:" + this.msg.x + " y:" + this.msg.y + " facingRight:" + this.msg.facingRight + " anim:" + this.msg.anim;
               break;
            case 11:
               msgstr = "ptype:" + this.msg.ptype + " x:" + this.msg.x + " y:" + this.msg.y + " velX:" + this.msg.velX + " velY:" + this.msg.velY + " damage:" + this.msg.damage + " skilllevel:" + this.msg.skilllevel;
               break;
            case 12:
               msgstr = "text: " + this.msg.text;
               break;
            case 13:
               msgstr = "time: " + this.msg.time;
               break;
            case 14:
               msgstr = "time : " + this.msg.time;
         }
         return str + msgstr + "]";
      }
      
      internal function toString() : String
      {
         var output:String = null;
         var msgstr:String = null;
         output = this.time + DELIM + this.msgType + DELIM + this.sender + DELIM;
         switch(this.msgType)
         {
            case 2:
               msgstr = this.msg.charname + DELIM2 + this.msg.charlvl + DELIM2 + this.msg.stats + DELIM2 + this.msg.equip + DELIM2 + this.msg.skills + DELIM2 + this.msg.taunt + DELIM2 + this.msg.bg + DELIM2;
               if(this.msg.win)
               {
                  msgstr += "1";
               }
               else
               {
                  msgstr += "0";
               }
               break;
            case 6:
               msgstr = this.msg.lineArrayStr + DELIM2 + this.msg.nid + DELIM2 + this.msg.posX;
               break;
            case 7:
               msgstr = this.msg.hp + DELIM2 + this.msg.victim + DELIM2 + this.msg.launched;
               break;
            case 8:
               msgstr = this.msg.stance;
               break;
            case 9:
               msgstr = this.msg.anim;
               break;
            case 10:
               msgstr = this.msg.actionState + DELIM2 + this.msg.x + DELIM2 + this.msg.y + DELIM2;
               if(this.msg.facingRight)
               {
                  msgstr += "1";
               }
               else
               {
                  msgstr += "0";
               }
               if(this.msg.anim != "")
               {
                  msgstr += DELIM2 + this.msg.anim;
               }
               break;
            case 11:
               msgstr = this.msg.ptype + DELIM2 + this.msg.x + DELIM2 + this.msg.y + DELIM2 + this.msg.velX + DELIM2 + this.msg.velY + DELIM2 + this.msg.damage + DELIM2 + this.msg.skilllevel;
               break;
            case 12:
               msgstr = this.msg.text;
               break;
            case 13:
               msgstr = this.msg.time;
               break;
            case 14:
               msgstr = this.msg.time;
         }
         return output + msgstr;
      }
   }
}

