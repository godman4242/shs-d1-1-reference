package com.protobuf
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.getDefinitionByName;
   
   public class Message
   {
      
      protected var fieldDescriptors:Array;
      
      public function Message()
      {
         super();
         if(fieldDescriptors == null)
         {
            fieldDescriptors = [];
         }
      }
      
      public function writeToCodedStream(output:CodedOutputStream) : void
      {
         for each(var desc in fieldDescriptors)
         {
            if(this[desc.fieldName] == null)
            {
               if(desc.isRequired())
               {
                  trace("Missing required field " + desc.fieldName);
               }
            }
            else if(desc.isRepeated() && this[desc.fieldName] is Array)
            {
               for each(var elem in this[desc.fieldName])
               {
                  if(desc.isMessage())
                  {
                     output.writeMessage(desc.fieldNumber,elem);
                  }
                  else
                  {
                     output.writeField(desc.fieldNumber,elem,desc.type);
                  }
               }
            }
            else if(desc.isMessage())
            {
               if(this[desc.fieldName] is Message)
               {
                  output.writeMessage(desc.fieldNumber,this[desc.fieldName]);
               }
            }
            else
            {
               output.writeField(desc.fieldNumber,this[desc.fieldName],desc.type);
            }
         }
      }
      
      public function writeToDataOutput(output:IDataOutput) : void
      {
         var codedOutput:CodedOutputStream = CodedOutputStream.newInstance(output);
         writeToCodedStream(codedOutput);
      }
      
      public function readFromCodedStream(input:CodedInputStream) : void
      {
         var fieldNum:int = 0;
         var desc:Descriptor = null;
         var item:* = undefined;
         var classRef:Class = null;
         var size:int = 0;
         var bytes:ByteArray = null;
         var tag:int = input.readTag();
         while(tag != 0)
         {
            fieldNum = WireFormat.getTagFieldNumber(tag);
            desc = getDescriptorByFieldNumber(fieldNum);
            if(desc != null)
            {
               if(desc.isMessage())
               {
                  classRef = getDefinitionByName(desc.messageClass) as Class;
                  item = new classRef();
                  size = input.readRawVarint32();
                  bytes = input.readRawBytes(size);
                  bytes.position = 0;
                  item.readFromDataOutput(bytes);
               }
               else
               {
                  item = input.readPrimitiveField(desc.type);
               }
               if(desc.isRepeated() && this[desc.fieldName] is Array)
               {
                  this[desc.fieldName].push(item);
               }
               else
               {
                  this[desc.fieldName] = item;
               }
            }
            else
            {
               input.skipField(tag);
            }
            tag = input.readTag();
         }
      }
      
      public function readFromDataOutput(input:IDataInput) : void
      {
         var codedInput:CodedInputStream = CodedInputStream.newInstance(input);
         readFromCodedStream(codedInput);
      }
      
      public function getSerializedSize() : int
      {
         var size:int = 0;
         for each(var desc in fieldDescriptors)
         {
            if(this[desc.fieldName] != null)
            {
               size += CodedOutputStream.computeFieldSize(desc.fieldNumber,this[desc.fieldName],desc.type);
            }
         }
         return size;
      }
      
      protected function registerField(field:String, messageClass:String, type:int, label:int, fieldNumber:int) : void
      {
         if(fieldDescriptors[field] == null)
         {
            fieldDescriptors[field] = new Descriptor(field,messageClass,type,label,fieldNumber);
         }
      }
      
      public function getDescriptorByFieldNumber(fieldNum:int) : Descriptor
      {
         for each(var desc in fieldDescriptors)
         {
            if(desc.fieldNumber == fieldNum)
            {
               return desc;
            }
         }
         return null;
      }
      
      public function getDescriptor(field:String) : Descriptor
      {
         return fieldDescriptors[field];
      }
   }
}

