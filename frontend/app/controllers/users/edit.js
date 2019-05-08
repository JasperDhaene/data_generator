import Controller from '@ember/controller';

export default Controller.extend({
    actions: {
        saveUser(user) {
            user.save().then(this.transitionToRoute('users.show', user.id));
        }
    }
});