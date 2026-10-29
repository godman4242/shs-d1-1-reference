package
{
   public class XMLQuestWave
   {
      
      public var enemy:XMLList;
      
      public var friend:XMLList;
      
      public var neutral:XMLList;
      
      public var objective:XMLList;
      
      public var endless:int;
      
      public function XMLQuestWave(xml:XML)
      {
         super();
         if(xml == null)
         {
            return;
         }
         this.enemy = xml.enemy;
         this.friend = xml.friend;
         this.neutral = xml.neutral;
         this.objective = xml.objective;
         if(xml.endless.toString() == "")
         {
            this.endless = 0;
         }
         else
         {
            this.endless = xml.endless;
         }
      }
      
      public function init(_enemy:XMLList, _friend:XMLList = null, _neutral:XMLList = null, _objective:XMLList = null, endless:int = 0) : *
      {
         this.enemy = _enemy;
         if(_friend == null)
         {
            this.friend = new XMLList();
         }
         else
         {
            this.friend = _friend;
         }
         if(_neutral == null)
         {
            this.neutral = new XMLList();
         }
         else
         {
            this.neutral = _neutral;
         }
         if(_objective == null)
         {
            this.objective = new XMLList();
         }
         else
         {
            this.objective = _objective;
         }
         this.endless = endless;
      }
      
      public function initDuel() : *
      {
         this.enemy = new XMLList(<enemy><id>-1</id><qty>1</qty></enemy>);
         this.friend = new XMLList();
         this.neutral = new XMLList();
         this.objective = new XMLList();
         this.endless = 0;
      }
      
      public function initRecordedDuel() : *
      {
         this.enemy = new XMLList("<enemy><id>700</id><x>150</x><qty>1</qty></enemy><enemy><id>701</id><x>650</x><qty>1</qty></enemy>");
         this.friend = new XMLList();
         this.neutral = new XMLList();
         this.objective = new XMLList();
         this.endless = 0;
      }
      
      public function initCutscene(count:int) : *
      {
         var str:String = "";
         for(var i:int = 0; i < count; i++)
         {
            str += "<enemy><id>" + (700 + i).toString() + "</id><x>0</x><qty>1</qty></enemy>";
         }
         this.enemy = new XMLList(str);
         this.friend = new XMLList();
         this.neutral = new XMLList();
         this.objective = new XMLList();
         this.endless = 0;
      }
   }
}

