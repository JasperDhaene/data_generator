import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('users', function() {
    this.route('index', { path: '/' });
    this.route('show', { path: '/:user_id'})
    this.route('edit', { path: '/:user_id/edit'});
    this.route('new');
  });
  /*this.route('user', { path: '/user/:user_id' }, function() {
    this.route('edit', { path: '/edit'});
  });*/
});

export default Router;
