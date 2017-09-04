var $ = function(select){
   var elements = document.querySelectorAll(select);
   for(var i = 0; i < elements.length; i++){
      elements[i].on = function(event, func){this.addEventListener(event, func);}
   }
   return elements;
}

var app = {
   slotCount: 12,
   slots: [],
   itemDB: ['', '', 'brightness_high', 'directions_bike', 'alarm', 'android', 'attach_file', 'attach_money'],
   html: {
     container: $('.container')[0]
   },
   slotDown: undefined,
   init: function(){ 
      app.getRandomItem();
      app.renderSlots('First');
   },
   getRandomItem: function(){
      for(var i = 0; i < app.slotCount; i++){
         var choose = Math.floor(Math.random() * app.itemDB.length);
         app.slots[i] = app.itemDB[choose];
      }
   },
   renderSlots: function(type="End"){
      app.html.container.innerHTML = '';
      for(var i = 0; i < app.slotCount; i++){
         //Add the html
         var empty = app.slots[i] == '' ? 'empty' : '';
         var change = (i == app.slotDown || i == app.slotOver || type == 'First') ? type : '';
         var html = `
            <div class="slot" data-slot="${i}" draggable="true">
               <i class="material-icons ${empty} change${change}">${app.slots[i]}</i>
            </div>
         `;
         app.html.container.innerHTML += html;
      }
      app.html.slots = $('.slot');
      console.log(app.html.slots.length);
      for(var i = 0; i < app.slotCount; i++){
         app.initSlotEvents(app.html.slots[i]);
      }
   },
   initSlotEvents: function(slotElement){
      slotElement.on('dragstart', function(){
         console.log('Slot Down: ' + this.dataset.slot);
         app.slotDown = this.dataset.slot;
      })
      slotElement.on('dragenter', function(event){
         event.preventDefault();
      })
      slotElement.on('dragover', function(event){
         event.preventDefault();
         console.log('Slot Over: ' + this.dataset.slot);
         app.slotOver = this.dataset.slot;
      })
      slotElement.on('drop', function(){
         console.log('Slot Drop: ' + this.dataset.slot);
         app.switchSlots(app.slotOver, app.slotDown);
      });
   },
   switchSlots: function(slot1, slot2){
      //Switch the slots 
      console.log(`Switching: ${slot1} and ${slot2}`);
      app.renderSlots('Start');
      
      setTimeout(function(){
         var save = app.slots[slot1];
         app.slots[slot1] = app.slots[slot2];
         app.slots[slot2] = save;
         app.renderSlots();
      }, 500);
      
   }
}

app.init();