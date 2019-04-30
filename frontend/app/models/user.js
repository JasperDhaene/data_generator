import DS from 'ember-data';
const { Model } = DS;

export default Model.extend({
    firstName: DS.attr(),
    lastName: DS.attr(),
    email: DS.attr(),
    birthDate: DS.attr(),
    petsCount: DS.attr(),
});
