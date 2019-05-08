import DS from 'ember-data';
const { Model } = DS;

export default Model.extend({
    // no attribute specified = large, often complex, read-only attributes
    firstName: DS.attr('string'),
    lastName: DS.attr('string'),
    email: DS.attr('string'),
    birthDate: DS.attr('string'),
    petsCount: DS.attr('number'),
    fridge: DS.belongsTo('fridge')

    //TODO: convert dates to computed value
});
