package
{
   import fl.lang.Locale;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class LangManager
   {
      
      public static var ENGLISH:String = "en";
      
      public static var CHINESE:String = "zh-CN";
      
      public static var JAPANESE:String = "ja";
      
      public static var language:String = ENGLISH;
      
      internal static var format:TextFormat = new TextFormat();
      
      format.bold = true;
      
      public function LangManager()
      {
         super();
      }
      
      public static function setLanguage(id:String) : *
      {
         if(StatsManager.language == LangManager.CHINESE)
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.text = "载入中...";
         }
         else
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.text = "Loading language data...";
         }
         language = id;
         var server:String = "./data/";
         if(StatsManager.useExternalLang)
         {
            if(StatsManager.usePlayerIO)
            {
               server = QueryManagerPIO.instance.getStringsDir();
            }
            else
            {
               server = QueryManager.instance.server + "strings/";
            }
         }
         if(StatsManager.isMobile)
         {
            Mobile.instance.loadLanguage(id,server);
         }
         else
         {
            Locale.addXMLPath(ENGLISH,server + "shs3_en.xml");
            Locale.addXMLPath(CHINESE,server + "shs3_zh-CN.xml");
            Locale.loadLanguageXML(id,onLanguageLoad);
         }
      }
      
      public static function getLanguage() : String
      {
         return language;
      }
      
      internal static function onLanguageLoad(success:Boolean) : *
      {
         trace("language xml loaded");
         QuestEngine.init();
      }
      
      public static function getString(num:int, paramArray:Array = null) : String
      {
         var max:int = 0;
         var i:int = 0;
         var delimiter:String = null;
         var output:String = Locale.loadStringEx(num.toString(),language);
         if(output == null)
         {
            return "";
         }
         if(paramArray != null)
         {
            max = int(paramArray.length);
            for(i = 0; i < max; i++)
            {
               delimiter = "[" + i.toString() + "]";
               output = output.split(delimiter).join(paramArray[i]);
            }
         }
         return output;
      }
      
      public static function getQuestString(id:String) : String
      {
         if(id.charAt(0) != "I" || id.charAt(1) != "D")
         {
            return id;
         }
         var output:String = Locale.loadStringEx(id,language);
         if(output == null)
         {
            trace("quest string not found: " + id);
            return "";
         }
         return insertStatToString(output);
      }
      
      internal static function insertStatToString(input:String) : String
      {
         var output:String = "";
         var outputArray:Array = new Array();
         outputArray = input.split("%");
         var max:int = int(outputArray.length);
         for(var i:* = 0; i < max; i++)
         {
            if(i % 2 > 0)
            {
               outputArray[i] = " " + StatsManager.getStat(int(outputArray[i])) + " ";
            }
            output += outputArray[i];
         }
         return output;
      }
      
      public static function initTextField(textfield:TextField, bold:Boolean = false) : *
      {
         if(language == CHINESE)
         {
            textfield.embedFonts = false;
         }
         else if(language == JAPANESE)
         {
            textfield.embedFonts = false;
         }
         if(bold)
         {
            textfield.defaultTextFormat = format;
         }
      }
   }
}

