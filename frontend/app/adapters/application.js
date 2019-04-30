import DS from 'ember-data';

export default DS.JSONAPIAdapter.extend({
  host: 'http://api.localhost:3000'
});