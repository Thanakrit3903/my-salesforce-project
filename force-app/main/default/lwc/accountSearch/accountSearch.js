import { LightningElement } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountSearchController.searchAccounts';
import { NavigationMixin } from 'lightning/navigation';

export default class AccountSearch extends NavigationMixin(LightningElement) {
    searchKey = '';
    accounts;
    isLoading = false;
    columns = [
        {
            label: 'Name',
            fieldName: 'Name',
            sortable: true,
            type: 'button',
            typeAttributes: {
                label: { fieldName: 'Name' },
                name: 'view',
                variant: 'base',
            }
        },
        { label: 'Industry', fieldName: 'Industry', sortable: true },
        { label: 'Description', fieldName: 'Description', sortable: true },
    ];
    sortedBy;
    sortedDirection = 'asc';
    pageSize = 5;
    currentPage = 1;
    totalRecords = 0;

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }

    handleSearch() {
        this.isLoading = true;
        searchAccounts({ searchKey: this.searchKey })
            .then(result => {
                console.log('RESULT:', result);
                this.accounts = (result || []).map(acc => {
                    return {
                        Id: acc.Id,
                        Name: acc.Name || '-',
                        Industry: acc.Industry || '-',
                        Description: acc.Description || '-'
                    };
                });
                this.totalRecords = this.accounts.length;
                this.currentPage = 1;
            })
            .catch(error => {
                console.error('Error searching accounts:', error);
            })
            .finally(() => {
                this.isLoading = false;
            });
    }

    handleRowAction(event) {

        const row = event.detail.row;

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: row.Id,
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }

    get hasAccounts() {
        return this.accounts && this.accounts.length > 0;
    }

    get noAccounts() {
        return this.accounts && this.accounts.length === 0;
    }

    handleSort(event) {
        const { fieldName: sortedBy, sortDirection } = event.detail;

        const cloneData = [...this.accounts];

        cloneData.sort((a, b) => {
            let valueA = a[sortedBy] || '';
            let valueB = b[sortedBy] || '';

            return sortDirection === 'asc'
                ? valueA.localeCompare(valueB)
                : valueB.localeCompare(valueA);
        });

        this.accounts = cloneData;
        this.sortedBy = sortedBy;
        this.sortedDirection = sortDirection;
    }

    get totalPages() {
        return Math.ceil(this.totalRecords / this.pageSize);
    }

    get paginatedData() {
        const start = (this.currentPage - 1) * this.pageSize;
        const end = this.pageSize * this.currentPage;
        return this.accounts.slice(start, end);
    }

    handleNext() {
        if (this.currentPage < this.totalPages) {
            this.currentPage++;
        }
    }

    handlePrev() {
        if (this.currentPage > 1) {
            this.currentPage--;
        }
    }
}