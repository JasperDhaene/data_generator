import DS from 'ember-data';

export default DS.JSONAPIAdapter.extend({
  host: 'http://api.intuo.local:3000'
});