import { LightningElement } from 'lwc';

export default class Helloword extends LightningElement {
    name = '';

    handleChange(event) {
        this.name = event.target.value;
    }
}