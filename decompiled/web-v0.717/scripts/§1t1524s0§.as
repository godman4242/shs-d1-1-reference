package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.System;
   import flash.utils.ByteArray;
   import playerio.§1t23s0§;
   
   public class §1t1524s0§
   {
      
      public static var §1t9779s0§:Vector.<§1t104s0§>;
      
      public static var §1t9780s0§:Vector.<§1t108s0§>;
      
      public static var nodeList:Vector.<§1t72s0§>;
      
      public static var §1t1285s0§:Vector.<§1t69s0§>;
      
      public static var §1t553s0§:Vector.<§1t76s0§>;
      
      public static var §1t9781s0§:Vector.<§1t106s0§>;
      
      public static var §1t9782s0§:Vector.<§1t111s0§>;
      
      public static var §1t1222s0§:Array;
      
      public static var §1t9783s0§:Vector.<§1t109s0§>;
      
      public static var §1t9784s0§:Array;
      
      public static var §1t9785s0§:Array;
      
      public static var §1t9786s0§:Array;
      
      internal static var §1t9821s0§:Function;
      
      public static var §1t7958s0§:BitmapData;
      
      internal static var §1t7949s0§:Array;
      
      internal static var §1t2097s0§:§1t103s0§;
      
      internal static var §1t9870s0§:§1t69s0§;
      
      internal static var §1t9787s0§:Vector.<§1t107s0§> = new Vector.<§1t107s0§>();
      
      internal static var §1t9788s0§:Vector.<§1t107s0§> = new Vector.<§1t107s0§>();
      
      internal static var §1t9789s0§:uint = 0;
      
      internal static var §1t9790s0§:uint = 0;
      
      internal static var §1t9791s0§:uint = 0;
      
      internal static var §1t9792s0§:uint = 0;
      
      internal static var §1t9793s0§:uint = 0;
      
      internal static var §1t9794s0§:uint = 0;
      
      internal static var §1t9795s0§:uint = 0;
      
      internal static var §1t9796s0§:uint = 0;
      
      internal static var §1t9797s0§:uint = 0;
      
      internal static var §1t9798s0§:uint = 0;
      
      internal static var §1t9799s0§:uint = 0;
      
      internal static var §1t9800s0§:uint = 0;
      
      public static var §1t9801s0§:String = "./data/";
      
      internal static const §1t9843s0§:Class = §1t4647s0§;
      
      public static var §1t9844s0§:XML = null;
      
      internal static const §1t9847s0§:Class = §1t4648s0§;
      
      public static var §1t9852s0§:String = "";
      
      internal static var §1t9856s0§:int = 0;
      
      internal static var §1t9857s0§:int = 11;
      
      public function §1t1524s0§()
      {
         super();
         init();
      }
      
      public static function init() : void
      {
         §1t1523s0§.§1t9365s0§.§1t1039s0§.§1t6113s0§.text = §1t1521s0§.getString(11070,["0"]);
         §1t9780s0§ = new Vector.<§1t108s0§>();
         nodeList = new Vector.<§1t72s0§>();
         §1t1285s0§ = new Vector.<§1t69s0§>();
         §1t9779s0§ = new Vector.<§1t104s0§>();
         §1t553s0§ = new Vector.<§1t76s0§>();
         §1t9781s0§ = new Vector.<§1t106s0§>();
         §1t9782s0§ = new Vector.<§1t111s0§>();
         §1t1222s0§ = new Array();
         §1t9784s0§ = new Array();
         §1t9785s0§ = new Array();
         §1t9786s0§ = new Array();
         §1t9783s0§ = new Vector.<§1t109s0§>();
         §1t9856s0§ = 0;
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1791s0§();
         }
         else
         {
            §1t9813s0§();
         }
         §1t1523s0§.§1t9562s0§();
         §1t9845s0§();
      }
      
      public static function §1t9803s0§(param1:XML) : void
      {
         §1t9780s0§.fixed = false;
         var _loc2_:int = param1.map.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t9780s0§.push(new §1t108s0§(param1.map[_loc3_]));
            _loc3_++;
         }
         §1t9780s0§.fixed = true;
         System.disposeXML(param1);
      }
      
      public static function §1t9804s0§(param1:XML) : void
      {
         var _loc3_:§1t72s0§ = null;
         nodeList.fixed = false;
         var _loc2_:* = param1.node.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = new §1t72s0§(param1.node[_loc4_]);
            if(_loc3_.overwrite != §1t72s0§.§1t9191s0§)
            {
               _loc3_.§1t1175s0§ = false;
            }
            nodeList.push(_loc3_);
            _loc4_++;
         }
         nodeList.fixed = true;
         System.disposeXML(param1);
      }
      
      public static function §1t9805s0§(param1:XML) : void
      {
         §1t1285s0§.fixed = false;
         var _loc2_:int = param1.quest.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t1285s0§.push(new §1t69s0§(param1.quest[_loc3_]));
            _loc3_++;
         }
         §1t1285s0§.fixed = true;
         System.disposeXML(param1);
      }
      
      public static function §1t9806s0§(param1:XML) : void
      {
         §1t9779s0§.fixed = false;
         var _loc2_:int = param1.item.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t9779s0§.push(new §1t104s0§(param1.item[_loc3_]));
            _loc3_++;
         }
         §1t9779s0§.fixed = true;
         System.disposeXML(param1);
      }
      
      public static function §1t9807s0§(param1:XML) : void
      {
         §1t553s0§.fixed = false;
         var _loc2_:int = param1.npc.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t553s0§.push(new §1t76s0§(param1.npc[_loc3_]));
            _loc3_++;
         }
         §1t553s0§.fixed = true;
         System.disposeXML(param1);
      }
      
      public static function §1t9808s0§(param1:XML) : void
      {
         §1t9781s0§.fixed = false;
         var _loc2_:int = param1.bg.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t9781s0§.push(new §1t106s0§(param1.bg[_loc3_]));
            _loc3_++;
         }
         §1t9781s0§.fixed = true;
         System.disposeXML(param1);
      }
      
      public static function §1t9809s0§(param1:XML) : void
      {
         var _loc2_:int = param1.skill.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t1222s0§.push(new §1t105s0§(param1.skill[_loc3_]));
            _loc3_++;
         }
         §1t1222s0§.sortOn("order",Array.NUMERIC);
         System.disposeXML(param1);
      }
      
      public static function §1t9810s0§(param1:XML) : void
      {
         §1t9783s0§.fixed = false;
         var _loc2_:int = param1.achievement.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t9783s0§.push(new §1t109s0§(param1.achievement[_loc3_]));
            _loc3_++;
         }
         §1t9783s0§.fixed = true;
         System.disposeXML(param1);
      }
      
      public static function §1t9811s0§(param1:XML) : *
      {
         §1t9782s0§.fixed = false;
         var _loc2_:int = param1.ui.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t9782s0§.push(new §1t111s0§(param1.ui[_loc3_]));
            _loc3_++;
         }
         §1t9782s0§.fixed = true;
         System.disposeXML(param1);
      }
      
      public static function §1t9812s0§(param1:XML) : void
      {
         var _loc4_:XMLList = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc2_:int = int(param1.§default§.item.length());
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §1t9784s0§.push(int(param1.§default§.item[_loc3_]));
            _loc3_++;
         }
         _loc2_ = int(param1.special.item.length());
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            §1t9785s0§.push(int(param1.special.item[_loc3_]));
            _loc3_++;
         }
         _loc2_ = int(param1.rotation.set.length());
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = XMLList(param1.rotation.set[_loc3_]);
            _loc5_ = new Array();
            _loc6_ = 0;
            while(_loc6_ < _loc4_.item.length())
            {
               _loc5_.push(int(_loc4_.item[_loc6_]));
               _loc6_++;
            }
            §1t9786s0§.push(_loc5_);
            _loc3_++;
         }
         System.disposeXML(param1);
      }
      
      public static function §1t9813s0§() : void
      {
         §1t9815s0§();
         §1t9817s0§();
         §1t9819s0§();
         §1t9825s0§();
         §1t9827s0§();
         §1t9831s0§();
         §1t9829s0§();
         §1t9833s0§();
         §1t9835s0§();
         §1t9837s0§();
         §1t9848s0§();
      }
      
      internal static function §1t9814s0§(param1:ByteArray, param2:int) : ByteArray
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(param1,3);
         var _loc4_:int = param1.length - 3;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_[_loc5_] ^= param2;
            _loc5_++;
         }
         _loc3_.position = 0;
         _loc3_.uncompress();
         return _loc3_;
      }
      
      public static function §1t9815s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9816s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9020s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9816s0§(param1:Event) : void
      {
         var _loc2_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9020s0§);
         var _loc3_:ByteArray = ByteArray(param1.target.data);
         var _loc4_:ByteArray = §1t9814s0§(_loc3_,§1t1523s0§.§1t9777s0§(_loc2_,1));
         var _loc5_:XML = new XML(_loc4_.readUTFBytes(_loc4_.length));
         §1t9803s0§(_loc5_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9325s0§);
         }
      }
      
      public static function §1t9817s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9818s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9009s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9818s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9795s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9009s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9804s0§(_loc6_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9327s0§);
         }
      }
      
      public static function §1t9819s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9820s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         var _loc2_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9021s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§);
         if(§1t1521s0§.getLanguage() != §1t1521s0§.§1t9271s0§)
         {
            _loc2_ = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9021s0§) + "_" + §1t1521s0§.getLanguage() + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§);
         }
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(_loc2_)));
      }
      
      public static function §1t9820s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9789s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9021s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9805s0§(_loc6_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9328s0§);
         }
      }
      
      public static function §1t9822s0§(param1:Function) : void
      {
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc2_.addEventListener(Event.COMPLETE,§1t9823s0§,false,0,true);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,§1t9824s0§,false,0,true);
         §1t9821s0§ = param1;
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9021s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§);
         if(§1t1521s0§.getLanguage() != §1t1521s0§.§1t9271s0§)
         {
            _loc3_ = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9021s0§) + "_" + §1t1521s0§.getLanguage() + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§);
         }
         _loc2_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(_loc3_)));
      }
      
      internal static function §1t9823s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9789s0§ = _loc2_.§1t2270s0§();
         §1t1285s0§.fixed = false;
         §1t1285s0§.length = 0;
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9021s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9805s0§(_loc6_);
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9328s0§);
         }
         §1t9821s0§(true);
      }
      
      internal static function §1t9824s0§(param1:Error) : *
      {
         §1t9821s0§(false);
      }
      
      public static function §1t9825s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9826s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9010s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9826s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9790s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9010s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9806s0§(_loc6_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9329s0§);
         }
      }
      
      public static function §1t9827s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9828s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9011s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9828s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9791s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9011s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9807s0§(_loc6_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9330s0§);
         }
      }
      
      public static function §1t9829s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9830s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9022s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9830s0§(param1:Event) : void
      {
         var _loc2_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9022s0§);
         var _loc3_:ByteArray = ByteArray(param1.target.data);
         var _loc4_:ByteArray = §1t9814s0§(_loc3_,§1t1523s0§.§1t9777s0§(_loc2_,1));
         var _loc5_:XML = new XML(_loc4_.readUTFBytes(_loc4_.length));
         §1t9808s0§(_loc5_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9332s0§);
         }
      }
      
      public static function §1t9831s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9832s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9012s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9832s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9792s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9012s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9809s0§(_loc6_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9331s0§);
         }
      }
      
      public static function §1t9833s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9834s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9013s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9834s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9793s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9013s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9810s0§(_loc6_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9326s0§);
         }
      }
      
      public static function §1t9835s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9836s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9014s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9836s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9794s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9014s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9812s0§(_loc6_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9333s0§);
         }
      }
      
      public static function §1t9837s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9838s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9065s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9838s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9796s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9065s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t9811s0§(_loc6_);
         §1t9858s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9352s0§);
         }
      }
      
      public static function §1t9839s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9840s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t24s0§.§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9062s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9840s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9797s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9062s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t24s0§.§1t8796s0§(_loc6_);
         §1t24s0§.§1t8794s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9350s0§);
         }
      }
      
      public static function §1t9841s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc1_.addEventListener(Event.COMPLETE,§1t9842s0§,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,§1t24s0§.§1t8795s0§,false,0,true);
         _loc1_.load(new URLRequest(§1t3318s0§.instance.§1t3331s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9063s0§) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§))));
      }
      
      public static function §1t9842s0§(param1:Event) : void
      {
         var _loc2_:§1t2266s0§ = new §1t2266s0§();
         _loc2_.update(ByteArray(param1.target.data));
         §1t9798s0§ = _loc2_.§1t2270s0§();
         var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9063s0§);
         var _loc4_:ByteArray = ByteArray(param1.target.data);
         var _loc5_:ByteArray = §1t9814s0§(_loc4_,§1t1523s0§.§1t9777s0§(_loc3_,1));
         var _loc6_:XML = new XML(_loc5_.readUTFBytes(_loc5_.length));
         §1t24s0§.§1t8799s0§(_loc6_);
         §1t24s0§.§1t8794s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1794s0§(param1.target.data,§1t1523s0§.§1t9351s0§);
         }
      }
      
      private static function §1t9845s0§() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         if(§1t1523s0§.§1t9493s0§)
         {
            _loc1_.load(new URLRequest(§1t9801s0§ + "traproomdata.xml"));
            _loc1_.addEventListener(Event.COMPLETE,§1t9846s0§);
         }
         else
         {
            §1t9844s0§ = new XML(new §1t9843s0§());
         }
      }
      
      private static function §1t9846s0§(param1:Event) : void
      {
         §1t9844s0§ = new XML(param1.target.data);
      }
      
      public static function §1t9848s0§() : *
      {
         var _loc1_:Loader = new Loader();
         _loc1_.contentLoaderInfo.addEventListener(Event.COMPLETE,§1t9850s0§);
         _loc1_.loadBytes(new §1t9847s0§());
      }
      
      public static function §1t9849s0§(param1:Event) : *
      {
         var _loc2_:ByteArray = param1.target.data;
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1795s0§(_loc2_,§1t1523s0§.§1t9334s0§);
         }
         var _loc3_:Loader = new Loader();
         _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,§1t9850s0§);
         _loc3_.loadBytes(_loc2_);
      }
      
      public static function §1t9850s0§(param1:Event) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         §1t7958s0§ = Bitmap(LoaderInfo(param1.target).content).bitmapData;
         §1t7949s0§ = new Array();
         var _loc4_:int = §1t7958s0§.width;
         var _loc5_:int = §1t7958s0§.height;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               if(§1t7958s0§.getPixel(_loc6_,_loc7_) != 0)
               {
                  _loc2_ = _loc6_ - §1t6481s0§.§1t12536s0§ + §1t6481s0§.§1t12535s0§;
                  _loc3_ = _loc7_ - §1t6481s0§.§1t12537s0§;
                  §1t7949s0§.push(_loc2_ + 341 << 12 | _loc3_ + 341);
               }
               _loc7_++;
            }
            _loc6_++;
         }
         §1t9858s0§();
      }
      
      public static function §1t9851s0§() : Array
      {
         return §1t7949s0§;
      }
      
      public static function §1t9853s0§(param1:String) : *
      {
         §1t9852s0§ = param1;
      }
      
      public static function §1t9854s0§() : String
      {
         return §1t9852s0§;
      }
      
      public static function §1t9855s0§(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = int(§1t7949s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t7949s0§[_loc3_] == param1)
            {
               if(_loc3_ < §1t9852s0§.length)
               {
                  _loc4_ = int(§1t9852s0§.charAt(_loc3_));
                  if(_loc4_ == 0 && §1t70s0§.instance.§1t1142s0§(param1))
                  {
                     return 1;
                  }
                  if(§1t70s0§.instance.§1t1140s0§(param1))
                  {
                     _loc5_ = §1t70s0§.instance.§1t1141s0§(param1);
                     if(_loc5_ != -1)
                     {
                        return _loc5_;
                     }
                     return _loc4_;
                  }
                  return _loc4_;
               }
               return 0;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public static function §1t9858s0§() : *
      {
         ++§1t9856s0§;
         var _loc1_:int = Math.floor(§1t9856s0§ * 100 / §1t9857s0§);
         §1t1523s0§.§1t9365s0§.§1t1039s0§.§1t6113s0§.text = §1t1521s0§.getString(11070,[_loc1_.toString()]);
         if(§1t9856s0§ == §1t9857s0§)
         {
            System.pauseForGCIfCollectionImminent(0);
            §1t1523s0§.§1t9365s0§.§1t1039s0§.§1t6113s0§.text = §1t1521s0§.getString(11071);
            if(§1t2097s0§ == null || §1t2097s0§.hasEnded())
            {
               §1t9860s0§();
               §1t1523s0§.§1t9365s0§.§1t5355s0§();
            }
            else if(§1t2097s0§.§1t1055s0§())
            {
            }
         }
      }
      
      public static function §1t9859s0§(param1:§1t103s0§) : *
      {
         §1t2097s0§ = param1;
      }
      
      public static function §1t9860s0§() : *
      {
         §1t2097s0§ = null;
      }
      
      public static function §1t9861s0§() : *
      {
         if(§1t9856s0§ == §1t9857s0§)
         {
            §1t9860s0§();
            §1t1523s0§.§1t9365s0§.§1t5355s0§();
         }
      }
      
      public static function §1t8795s0§(param1:IOErrorEvent) : *
      {
         var event:IOErrorEvent = param1;
         if(§1t1523s0§.§1t9365s0§.currentScene.name == "loading" && !§1t1523s0§.§1t9365s0§.§1t8078s0§.visible)
         {
            §1t1523s0§.§1t9365s0§.§1t8078s0§.§1t5481s0§("Network error. Please check that you are connected to the Internet.",function():*
            {
               init();
            },null,"Retry");
         }
      }
      
      public static function §1t9862s0§(param1:int) : §1t104s0§
      {
         var _loc3_:§1t104s0§ = null;
         var _loc2_:int = int(§1t9779s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = §1t9779s0§[_loc4_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function §1t9863s0§(param1:int) : §1t105s0§
      {
         var _loc3_:§1t105s0§ = null;
         var _loc2_:int = int(§1t1222s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = §1t1222s0§[_loc4_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function §1t9864s0§(param1:int) : §1t106s0§
      {
         var _loc3_:§1t106s0§ = null;
         var _loc2_:int = int(§1t9781s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = §1t9781s0§[_loc4_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return new §1t106s0§(null);
      }
      
      public static function §1t9865s0§(param1:int) : Vector.<§1t105s0§>
      {
         var _loc4_:§1t105s0§ = null;
         var _loc2_:Vector.<§1t105s0§> = new Vector.<§1t105s0§>();
         var _loc3_:int = int(§1t1222s0§.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = §1t1222s0§[_loc5_];
            if(_loc4_.category == param1)
            {
               _loc2_.push(_loc4_);
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function §1t9866s0§(param1:int, param2:Boolean = true) : *
      {
         var _loc4_:§1t69s0§ = null;
         var _loc6_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         if(!§1t1523s0§.§1t9754s0§)
         {
            return;
         }
         §1t9787s0§.length = 0;
         var _loc3_:Vector.<§1t107s0§> = new Vector.<§1t107s0§>();
         var _loc5_:Vector.<§1t85s0§> = new Vector.<§1t85s0§>();
         var _loc7_:* = int(§1t1285s0§.length);
         var _loc8_:int = §1t1523s0§.getLevel() + 2;
         var _loc9_:int = §1t1523s0§.getLevel() - 2;
         var _loc10_:int = 0;
         while(_loc10_ < _loc7_)
         {
            _loc4_ = §1t1285s0§[_loc10_];
            _loc5_ = _loc4_.§1t1454s0§();
            _loc6_ = _loc4_.id;
            _loc11_ = §1t1523s0§.§1t9563s0§(_loc6_);
            if(_loc11_ >= 0 && _loc11_ < _loc5_.length)
            {
               if(_loc5_[_loc11_].teleportNodeID == param1)
               {
                  §1t9787s0§.push(new §1t107s0§(_loc4_,_loc11_,§1t1711s0§.§1t11268s0§));
               }
            }
            else if(_loc4_.startin != -1 && _loc5_.length > 0 && _loc5_[0].nodeID == param1 && (_loc4_.type == 1 || !§1t1523s0§.§1t641s0§(_loc6_)) && §1t1523s0§.§1t640s0§(_loc5_[0].condition))
            {
               _loc12_ = _loc4_.type;
               _loc13_ = _loc4_.level;
               _loc14_ = §1t1523s0§.getLevel();
               if(_loc12_ == §1t1711s0§.§1t11264s0§ || _loc12_ == §1t1711s0§.§1t11266s0§ || _loc12_ == §1t1711s0§.§1t11267s0§)
               {
                  §1t9787s0§.push(new §1t107s0§(_loc4_,0,_loc12_));
               }
               else
               {
                  if(_loc13_ == 0 || _loc13_ >= _loc14_ - 1 && _loc13_ <= _loc14_ + 1)
                  {
                     _loc12_ = §1t1711s0§.§1t11262s0§;
                  }
                  else if(_loc13_ == _loc14_ + 2)
                  {
                     _loc12_ = §1t1711s0§.§1t11269s0§;
                  }
                  else if(_loc13_ == _loc14_ - 2)
                  {
                     _loc12_ = §1t1711s0§.§1t11270s0§;
                  }
                  else
                  {
                     _loc12_ = -1;
                  }
                  if(_loc12_ != -1)
                  {
                     _loc3_.push(new §1t107s0§(_loc4_,0,_loc12_));
                  }
               }
            }
            _loc10_++;
         }
         if(param2)
         {
            §1t9788s0§.length = 0;
            _loc7_ = int(_loc3_.length);
            if(_loc7_ <= 3)
            {
               §1t9788s0§ = _loc3_;
            }
            else
            {
               _loc10_ = 0;
               while(_loc10_ < 3)
               {
                  _loc15_ = Math.random() * _loc7_;
                  §1t9788s0§.push(_loc3_[_loc15_]);
                  _loc3_.splice(_loc15_,1);
                  _loc7_--;
                  _loc10_++;
               }
            }
         }
      }
      
      public static function §1t9867s0§() : Vector.<§1t107s0§>
      {
         return §1t9787s0§.concat(§1t9788s0§);
      }
      
      public static function §1t9868s0§(param1:int, param2:int) : *
      {
         var _loc4_:§1t107s0§ = null;
         var _loc3_:int = int(§1t9788s0§.length);
         var _loc5_:* = int(_loc3_ - 1);
         while(_loc5_ >= 0)
         {
            _loc4_ = §1t9788s0§[_loc5_];
            if(_loc4_.id == param1 && _loc4_.§1t1103s0§ == param2)
            {
               §1t9788s0§.splice(_loc5_,1);
               break;
            }
            _loc5_--;
         }
      }
      
      public static function §1t9869s0§(param1:int, param2:int = -1) : Vector.<§1t107s0§>
      {
         var _loc4_:§1t69s0§ = null;
         var _loc6_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc3_:Vector.<§1t107s0§> = new Vector.<§1t107s0§>();
         var _loc5_:Vector.<§1t85s0§> = new Vector.<§1t85s0§>();
         var _loc7_:int = int(§1t1285s0§.length);
         var _loc8_:int = §1t1523s0§.getLevel() + 2;
         var _loc9_:int = §1t1523s0§.getLevel() - 2;
         var _loc10_:int = 0;
         while(_loc10_ < _loc7_)
         {
            _loc4_ = §1t1285s0§[_loc10_];
            _loc5_ = _loc4_.§1t1454s0§();
            _loc6_ = _loc4_.id;
            if(_loc4_.startin != -1 && (param2 == -1 || _loc4_.startin == param2))
            {
               if(_loc4_.level <= _loc8_ && _loc4_.level >= _loc9_ && (_loc4_.type == 1 || !§1t1523s0§.§1t641s0§(_loc6_)))
               {
                  _loc11_ = §1t1523s0§.§1t9563s0§(_loc6_);
                  if(_loc11_ >= 0 && _loc11_ < _loc5_.length)
                  {
                     if(_loc5_[_loc11_].nodeID == param1)
                     {
                        _loc3_.push(new §1t107s0§(_loc4_,_loc11_,§1t1711s0§.§1t11268s0§));
                     }
                  }
                  else if(_loc5_.length > 0 && _loc5_[0].nodeID == param1 && §1t1523s0§.§1t640s0§(_loc5_[0].condition))
                  {
                     _loc12_ = _loc4_.type;
                     _loc13_ = _loc4_.level;
                     _loc14_ = §1t1523s0§.getLevel();
                     if(_loc12_ != §1t1711s0§.§1t11266s0§)
                     {
                        if(_loc13_ > _loc14_ + 3)
                        {
                           _loc12_ = §1t1711s0§.§1t11269s0§;
                        }
                        else if(_loc13_ < _loc14_ + 3)
                        {
                           _loc12_ = §1t1711s0§.§1t11270s0§;
                        }
                     }
                     _loc3_.push(new §1t107s0§(_loc4_,0,_loc12_));
                  }
               }
            }
            else
            {
               _loc11_ = §1t1523s0§.§1t9563s0§(_loc6_);
               if(_loc11_ != -1)
               {
                  if(_loc5_[_loc11_].nodeID == param1)
                  {
                     if(§1t1523s0§.§1t640s0§(_loc5_[_loc11_].condition) == true)
                     {
                        _loc3_.push(new §1t107s0§(_loc4_,_loc11_,§1t1711s0§.§1t11268s0§));
                     }
                  }
               }
            }
            _loc10_++;
         }
         return _loc3_;
      }
      
      public static function §1t9871s0§(param1:int) : §1t69s0§
      {
         var _loc3_:§1t69s0§ = null;
         if(param1 == §1t123s0§.§1t11212s0§)
         {
            return §1t9870s0§;
         }
         var _loc2_:int = int(§1t1285s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = §1t1285s0§[_loc4_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function §1t9872s0§(param1:int, param2:int) : §1t85s0§
      {
         var _loc3_:§1t69s0§ = null;
         if(param1 == §1t123s0§.§1t11212s0§)
         {
            _loc3_ = §1t9870s0§;
         }
         else
         {
            _loc3_ = §1t9871s0§(param1);
         }
         if(_loc3_ != null)
         {
            return _loc3_.§1t1453s0§(param2);
         }
         return null;
      }
      
      public static function §1t9873s0§(param1:§1t69s0§) : *
      {
         if(param1.id == §1t123s0§.§1t11212s0§)
         {
            §1t9870s0§ = param1;
            return;
         }
         var _loc2_:int = int(§1t1285s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t1285s0§[_loc3_].id == param1.id)
            {
               §1t1285s0§[_loc3_] = param1;
               return;
            }
            _loc3_++;
         }
         §1t1285s0§.fixed = false;
         §1t1285s0§.push(param1);
         §1t1285s0§.fixed = true;
      }
      
      public static function §1t9874s0§(param1:int) : §1t76s0§
      {
         var _loc3_:§1t76s0§ = null;
         var _loc2_:int = int(§1t553s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = §1t553s0§[_loc4_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function §1t9875s0§(param1:int) : *
      {
         var _loc2_:int = int(§1t553s0§.length);
         §1t553s0§.fixed = false;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t553s0§[_loc3_].id == param1)
            {
               §1t553s0§.splice(_loc3_,1);
               return;
            }
            _loc3_++;
         }
         §1t553s0§.fixed = true;
      }
      
      public static function §1t9876s0§(param1:§1t76s0§) : *
      {
         var _loc2_:int = int(§1t553s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t553s0§[_loc3_].id == param1.id)
            {
               §1t553s0§[_loc3_] = param1;
               return;
            }
            _loc3_++;
         }
         §1t553s0§.fixed = false;
         §1t553s0§.push(param1);
         §1t553s0§.fixed = true;
      }
      
      public static function §1t9877s0§(param1:int, param2:String, param3:int = 0) : *
      {
         var _loc4_:§1t76s0§ = §1t9874s0§(param1);
         if(_loc4_ == null)
         {
            _loc4_ = new §1t76s0§(null);
         }
         if(_loc4_.§1t1253s0§())
         {
            return;
         }
         _loc4_ = _loc4_.getClone();
         _loc4_.id = §1t76s0§.§1t9198s0§;
         _loc4_.lvl = param3;
         _loc4_.§1t1252s0§(param2);
         §1t9876s0§(_loc4_);
      }
      
      public static function §1t9878s0§(param1:int, param2:String, param3:int, param4:String = "") : *
      {
         var _loc5_:§1t76s0§ = null;
         if(param1 != §1t76s0§.§1t9196s0§)
         {
            _loc5_ = §1t9874s0§(param1);
         }
         if(_loc5_ == null)
         {
            _loc5_ = new §1t76s0§(null);
         }
         _loc5_ = _loc5_.getClone();
         _loc5_.id = §1t76s0§.§1t9196s0§;
         _loc5_.lvl = param3;
         if(param4 != "")
         {
            _loc5_.setName(param4);
         }
         _loc5_.§1t1252s0§(param2);
         §1t9876s0§(_loc5_);
      }
      
      public static function §1t9879s0§(param1:String, param2:String) : *
      {
         var _loc3_:§1t76s0§ = §1t9874s0§(§1t76s0§.§1t9201s0§);
         if(_loc3_ == null)
         {
            _loc3_ = new §1t76s0§(null);
            _loc3_.id = §1t76s0§.§1t9201s0§;
            _loc3_.ai = 30;
         }
         _loc3_.setName(param2);
         _loc3_.§1t1252s0§(param1);
         §1t9876s0§(_loc3_);
      }
      
      public static function §1t9880s0§(param1:String, param2:String) : *
      {
         var _loc3_:§1t76s0§ = new §1t76s0§(null);
         _loc3_.id = §1t76s0§.§1t9198s0§;
         _loc3_.setName(param2);
         _loc3_.§1t1252s0§(param1);
         §1t9876s0§(_loc3_);
      }
      
      public static function §1t9881s0§() : *
      {
         var _loc2_:int = 0;
         §1t553s0§.fixed = false;
         var _loc1_:int = int(§1t553s0§.length);
         var _loc3_:* = int(_loc1_ - 1);
         while(_loc3_ >= 0)
         {
            _loc2_ = §1t553s0§[_loc3_].id;
            if(_loc2_ >= 700 && _loc2_ <= 710 || _loc2_ == §1t76s0§.§1t9198s0§ || _loc2_ == §1t76s0§.§1t9196s0§)
            {
               §1t553s0§.splice(_loc3_,1);
            }
            _loc3_--;
         }
         §1t553s0§.fixed = true;
      }
      
      public static function §1t1582s0§(param1:int) : String
      {
         var _loc2_:§1t76s0§ = §1t9874s0§(param1);
         if(_loc2_ != null)
         {
            return _loc2_.§1t509s0§();
         }
         return "?";
      }
      
      public static function §1t9882s0§(param1:int) : §1t74s0§
      {
         var _loc2_:§1t76s0§ = §1t9874s0§(param1);
         if(_loc2_ != null)
         {
            return _loc2_.§1t1246s0§();
         }
         return null;
      }
      
      public static function §1t9883s0§(param1:int) : §1t75s0§
      {
         var _loc2_:§1t76s0§ = §1t9874s0§(param1);
         if(_loc2_ != null)
         {
            return _loc2_.§1t1247s0§();
         }
         return null;
      }
      
      public static function §1t9884s0§(param1:int) : Vector.<§1t72s0§>
      {
         var _loc3_:§1t72s0§ = null;
         var _loc2_:Vector.<§1t72s0§> = new Vector.<§1t72s0§>();
         var _loc4_:int = int(nodeList.length);
         var _loc5_:int = §1t1523s0§.getLevel();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = nodeList[_loc6_];
            if(_loc3_.map == param1 && _loc3_.level <= _loc5_)
            {
               _loc2_.push(_loc3_);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public static function §1t9885s0§(param1:int) : §1t72s0§
      {
         var _loc3_:§1t72s0§ = null;
         var _loc2_:int = int(nodeList.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = nodeList[_loc4_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function §1t9886s0§(param1:int) : §1t72s0§
      {
         var _loc2_:§1t72s0§ = null;
         var _loc3_:int = int(nodeList.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = nodeList[_loc4_];
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return §1t70s0§.§1t9190s0§().§1t1137s0§(param1 >> 12 & 0x0FFF,param1 & 0x0FFF);
      }
      
      public static function §1t1183s0§(param1:int) : §1t73s0§
      {
         var _loc2_:§1t72s0§ = §1t9886s0§(param1);
         if(_loc2_ != null)
         {
            return _loc2_.§1t1183s0§();
         }
         return null;
      }
      
      public static function §1t9887s0§(param1:int = 0, param2:int = 0) : int
      {
         var _loc4_:§1t108s0§ = null;
         var _loc3_:int = int(§1t9780s0§.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = §1t9780s0§[_loc5_];
            if(_loc4_.x == param1 && _loc4_.y == param2)
            {
               return §1t9780s0§[_loc5_].id;
            }
            _loc5_++;
         }
         return -1;
      }
      
      public static function §1t9888s0§(param1:int) : §1t108s0§
      {
         var _loc3_:§1t108s0§ = null;
         var _loc2_:int = int(§1t9780s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = §1t9780s0§[_loc4_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function §1t9889s0§(param1:int) : §1t109s0§
      {
         if(param1 >= §1t9783s0§.length)
         {
            return null;
         }
         return §1t9783s0§[param1];
      }
      
      public static function §1t9890s0§() : int
      {
         var _loc3_:§1t109s0§ = null;
         var _loc1_:int = 0;
         var _loc2_:int = int(§1t9783s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ += §1t9783s0§[_loc4_].§1t1118s0§();
            _loc4_++;
         }
         return _loc1_;
      }
      
      public static function §1t9891s0§() : Array
      {
         var _loc3_:§1t109s0§ = null;
         var _loc1_:Array = new Array();
         var _loc2_:int = int(§1t9783s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_[_loc4_] = §1t9783s0§[_loc4_].§1t1118s0§();
            _loc4_++;
         }
         return _loc1_;
      }
      
      public static function §1t9892s0§() : BitmapData
      {
         return §1t7958s0§;
      }
      
      public static function §1t7976s0§(param1:int, param2:int) : *
      {
         return §1t7958s0§.getPixel(param1 + §1t7934s0§.§1t12536s0§ - 341 - §1t7934s0§.§1t12535s0§,param2 + §1t7934s0§.§1t12537s0§ - 341) != 0;
      }
      
      public static function §1t9893s0§(param1:int) : §1t111s0§
      {
         return §1t9782s0§[param1];
      }
      
      public static function §1t9894s0§(param1:§1t85s0§, param2:int) : *
      {
         §1t6427s0§.§1t12473s0§(false);
         var _loc3_:int = 400;
         if(param1.action == 6)
         {
            _loc3_ = 150;
         }
         §1t1540s0§.§1t10052s0§(param2,param1.action,param1.bg,param1.stagewidth,param1.time,param1.wave,_loc3_);
      }
      
      public static function §1t9895s0§() : void
      {
         §1t6427s0§.§1t12477s0§();
      }
      
      public static function §1t9896s0§(param1:int, param2:Boolean) : *
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:§1t72s0§ = §1t9886s0§(param1);
         if(_loc4_ != null)
         {
            _loc5_ = _loc4_.§1t1186s0§();
            _loc6_ = §1t1540s0§.§1t10002s0§;
            _loc7_ = int(_loc5_[_loc3_].isPrivate);
            if(_loc7_ == 9)
            {
               _loc6_ = §1t1540s0§.§1t10007s0§;
            }
            if(_loc5_ != null)
            {
               if(param2)
               {
                  §1t1540s0§.§1t10052s0§(-1,_loc6_,_loc5_[_loc3_].getBG(),_loc5_[_loc3_].getWidth(),0,null,151,_loc5_);
               }
               else
               {
                  §1t1540s0§.§1t10052s0§(-1,_loc6_,_loc5_[_loc3_].getBG(),_loc5_[_loc3_].getWidth(),0,null,_loc5_[_loc3_].enterx,_loc5_,_loc3_);
               }
            }
            if(param2 && §1t1523s0§.§1t9714s0§(40000) == 0)
            {
               §1t6427s0§.§1t12475s0§(0,0);
            }
            if(_loc3_ == 0)
            {
               §1t406s0§.instance.§1t6633s0§(true);
               §1t406s0§.instance.§1t6456s0§.setNodeId(param1);
            }
            else
            {
               §1t406s0§.instance.§1t6633s0§(false);
               §1t402s0§.instance.§1t6343s0§(param1,_loc3_,_loc5_);
            }
         }
      }
      
      public static function §1t9897s0§(param1:§1t23s0§) : Boolean
      {
         if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9009s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9009s0§)] != §1t9795s0§)
         {
            return true;
         }
         if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9010s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9010s0§)] != §1t9790s0§)
         {
            return true;
         }
         if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9011s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9011s0§)] != §1t9791s0§)
         {
            return true;
         }
         if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9012s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9012s0§)] != §1t9792s0§)
         {
            return true;
         }
         if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9013s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9013s0§)] != §1t9793s0§)
         {
            return true;
         }
         if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9014s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9014s0§)] != §1t9794s0§)
         {
            return true;
         }
         if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9065s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9065s0§)] != §1t9796s0§)
         {
            return true;
         }
         if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9271s0§ && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9015s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9015s0§)] != §1t9789s0§)
         {
            return true;
         }
         if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9277s0§ && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9016s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9016s0§)] != §1t9789s0§)
         {
            return true;
         }
         if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9279s0§ && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9017s0§)] != 0 && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9017s0§)] != §1t9789s0§)
         {
            return true;
         }
         §1t9799s0§ = param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9062s0§)];
         §1t9800s0§ = param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9063s0§)];
         return false;
      }
      
      public static function §1t9898s0§() : Boolean
      {
         if(§1t9799s0§ != 0 && §1t9799s0§ != §1t9797s0§)
         {
            return true;
         }
         if(§1t9800s0§ != 0 && §1t9800s0§ != §1t9798s0§)
         {
            return true;
         }
         return false;
      }
   }
}

