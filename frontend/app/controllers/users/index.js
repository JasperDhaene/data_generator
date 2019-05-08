import Controller from '@ember/controller';

export default Controller.extend({
    actions: {
        deleteRecord(id) {
            this.store.findRecord('user', id).then(function(user) {
                user.destroyRecord();
              });
        }
    }
});