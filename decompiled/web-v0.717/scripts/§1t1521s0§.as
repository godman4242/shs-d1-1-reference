package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class §1t1521s0§
   {
      
      public static var §1t9271s0§:String = "en";
      
      public static var CHINESE:String = "zh-CN";
      
      public static var §1t9275s0§:String = "ja";
      
      public static var §1t9277s0§:String = "fr";
      
      public static var §1t9279s0§:String = "es";
      
      public static var language:String = §1t9271s0§;
      
      internal static var format:TextFormat = new TextFormat();
      
      format.bold = true;
      
      public function §1t1521s0§()
      {
         super();
      }
      
      public static function §1t9281s0§(param1:String) : Boolean
      {
         if(param1 == §1t9271s0§ || param1 == §1t9277s0§ || param1 == §1t9279s0§)
         {
            return true;
         }
         return false;
      }
      
      public static function setLanguage(param1:String) : *
      {
         if(param1 == §1t1521s0§.§1t9271s0§)
         {
            §1t1523s0§.§1t9365s0§.§1t1039s0§.§1t6113s0§.text = "Loading language data...";
         }
         else if(param1 == §1t1521s0§.§1t9277s0§)
         {
            §1t1523s0§.§1t9365s0§.§1t1039s0§.§1t6113s0§.text = "Chargement fichiers langues...";
         }
         else if(param1 == §1t1521s0§.§1t9279s0§)
         {
            §1t1523s0§.§1t9365s0§.§1t1039s0§.§1t6113s0§.text = "Cargando datos de idioma...";
         }
         else
         {
            param1 = §1t1521s0§.§1t9271s0§;
            §1t1523s0§.§1t9365s0§.§1t1039s0§.§1t6113s0§.text = "Loading language data...";
         }
         language = param1;
         var _loc2_:String = "./data/";
         if(§1t1523s0§.§1t9495s0§)
         {
            if(§1t1523s0§.§1t9503s0§)
            {
               _loc2_ = §1t3318s0§.instance.§1t3330s0§();
            }
            else
            {
               _loc2_ = §1t3317s0§.instance.server + "strings/";
            }
         }
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1793s0§(param1,_loc2_);
         }
         else
         {
            Locale.addXMLPath(§1t9271s0§,_loc2_ + "shs3_en.xml");
            Locale.addXMLPath(§1t9277s0§,_loc2_ + "shs3_fr.xml");
            Locale.addXMLPath(§1t9279s0§,_loc2_ + "shs3_es.xml");
            Locale.loadLanguageXML(param1,§1t9286s0§);
         }
      }
      
      public static function §1t9283s0§(param1:String) : *
      {
         language = param1;
         var _loc2_:String = "./data/";
         Locale.addXMLPath(§1t9271s0§,_loc2_ + "shs3_en.xml");
         Locale.addXMLPath(§1t9277s0§,_loc2_ + "shs3_fr.xml");
         Locale.addXMLPath(§1t9279s0§,_loc2_ + "shs3_es.xml");
         Locale.loadLanguageXML(param1,§1t9286s0§);
      }
      
      public static function §1t9284s0§(param1:String, param2:Function) : *
      {
         language = param1;
         §1t1523s0§.language = param1;
         Locale.loadLanguageXML(param1,param2);
      }
      
      public static function getLanguage() : String
      {
         return language;
      }
      
      internal static function §1t9286s0§(param1:Boolean) : *
      {
         if(§1t1523s0§.§1t9494s0§)
         {
            §1t1522s0§.init();
         }
         else
         {
            §1t1524s0§.init();
         }
      }
      
      public static function getString(param1:int, param2:Array = null) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         if(param1 == -1)
         {
            return "";
         }
         var _loc3_:String = Locale.loadStringEx(param1.toString(),language);
         if(_loc3_ == null)
         {
            return "";
         }
         if(param2 != null)
         {
            _loc4_ = int(param2.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = "[" + _loc5_.toString() + "]";
               _loc3_ = _loc3_.split(_loc6_).join(param2[_loc5_]);
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public static function §1t9287s0§(param1:String) : String
      {
         if(param1.charAt(0) != "I" || param1.charAt(1) != "D")
         {
            return param1;
         }
         var _loc2_:String = Locale.loadStringEx(param1,language);
         if(_loc2_ == null)
         {
            return "";
         }
         return §1t9288s0§(_loc2_);
      }
      
      internal static function §1t9288s0§(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:Array = new Array();
         _loc3_ = param1.split("%");
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:* = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc5_ % 2 > 0)
            {
               _loc3_[_loc5_] = " " + §1t1523s0§.§1t9714s0§(int(_loc3_[_loc5_])) + " ";
            }
            _loc2_ += _loc3_[_loc5_];
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function §1t9290s0§(param1:TextField, param2:Boolean = false) : *
      {
         if(language == CHINESE || language == §1t9275s0§)
         {
            param1.embedFonts = false;
         }
         if(param2)
         {
            param1.defaultTextFormat = format;
         }
      }
      
      public static function §1t9291s0§() : *
      {
         var _loc1_:String = "./data/";
         if(§1t1523s0§.§1t9495s0§)
         {
            if(§1t1523s0§.§1t9503s0§)
            {
               _loc1_ = §1t3318s0§.instance.§1t3330s0§();
            }
            else
            {
               _loc1_ = §1t3317s0§.instance.server + "strings/";
            }
         }
         if(language == §1t9271s0§)
         {
            §1t9292s0§(language,_loc1_ + "tower_en.xml",§1t24s0§.§1t8794s0§);
         }
         else if(language == §1t9277s0§)
         {
            §1t9292s0§(language,_loc1_ + "tower_fr.xml",§1t24s0§.§1t8794s0§);
         }
         else if(language == §1t9279s0§)
         {
            §1t9292s0§(language,_loc1_ + "tower_es.xml",§1t24s0§.§1t8794s0§);
         }
      }
      
      internal static function §1t9292s0§(param1:String, param2:String, param3:Function) : *
      {
         var lang:String = param1;
         var filename:String = param2;
         var callback:Function = param3;
         var §1t13285s0§:URLLoader = new URLLoader();
         §1t13285s0§.load(new URLRequest(filename));
         §1t13285s0§.addEventListener(Event.COMPLETE,function(param1:Event):*
         {
            var _loc5_:XML = null;
            var _loc2_:XML = new XML(param1.target.data);
            var _loc3_:XMLList = _loc2_.file.body.children();
            var _loc4_:int = _loc3_.length();
            var _loc6_:int = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ = _loc3_[_loc6_];
               Locale.setString(_loc5_.@id,lang,_loc5_.source);
               _loc6_++;
            }
            callback();
         });
      }
   }
}

