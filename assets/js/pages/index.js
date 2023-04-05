'use strict';

    var bouncer = new Bouncer('[data-validate]', {
        disableSubmit: true
    });
    
    document.addEventListener(
        'bouncerFormInvalid',
        function (event) {
          window.scrollTo(0, event.detail.errors[0].offsetTop);
        },
        false
      );
      
      document.addEventListener(
        'bouncerFormValid',
        function () {
          alert('Form submitted successfully!');
          window.location.reload();
        },
        false
      );