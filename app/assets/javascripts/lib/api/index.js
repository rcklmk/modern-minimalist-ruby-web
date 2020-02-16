GlobalBase.registerModule('@api', (require, exports) => {
  let fetch = require('@dom/fetch').default;

  exports.default = {
    Bill: {
      fetchAll() {
        return fetch('/api/bills').then(_ => _.json());
      },
      create(bill) {
        return fetch('/api/bills/create', {
          method: 'POST',
          body: formify(bill)
        });
      },
      update(bill) {
        return fetch(`/api/bills/${bill.id}/update`, {
          method: 'PATCH'
        });
      },
      delete(bill) {
        return fetch(`/api/bills/${bill.id}/delete`, {
          method: 'DELETE'
        });
      }
    }
  };
});
