import DS from 'ember-data';
const { Model } = DS;

export default Model.extend({
    brand: DS.attr('string'),
    last_technical_check: DS.attr('string'),
    user: DS.belongsTo('user')
});
