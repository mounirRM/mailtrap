import { LightningElement, api,wire } from 'lwc';
import getUsrDisplayName from '@salesforce/apex/EmailHandler.getUserDisplayName';
import updateDisplayName from'@salesforce/apex/EmailHandler.updateDisplayName';
import { ShowToastEvent } from "lightning/platformShowToastEvent";



export default class DisplayEmailForName extends LightningElement {
    userdisplayname;
    futurdisplayname;

    @wire(getUsrDisplayName)
    getUsrDisplayName({ error, data }) {
        if (data) {
            this.userdisplayname = data;
            console.log(data);
        } else if (error) {
            console.error(error);
        }
    }

    handledisplayname(event){
        this.futurdisplayname = event.target.value;
        console.log(event.target.value);
    }

    handleClick(){
        this.userdisplayname = this.futurdisplayname;
        updateDisplayName({ futurdispname: this.futurdisplayname})
            .then((result)=>{
               console.log(JSON.stringify(result));
               const event = new ShowToastEvent({
                title: 'Display Name changed successfully',
                message: 'Display Name changed successfully',
                variant: 'success',
                mode: 'dismissable'
            });
            this.dispatchEvent(event);
            })
            .catch((error)=>{
                console.log(error);
        });
    }
}