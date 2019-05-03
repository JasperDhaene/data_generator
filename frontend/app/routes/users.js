import Route from '@ember/routing/route';

export default Route.extend({
    model() {
        return this.get('store').findAll('user');
    },
    //action? SHOULD THIS BE HERE?
    show: function() {
        // redirect root to photos
        this.transitionTo( 'users.show' );
    }
});
