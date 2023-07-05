// function validateForm(options) {
//     // get form element needing to validate
//     let formEl = document.querySelector(options.form);
//     let messageEl = document.querySelector(options.message);
//
//     if (formEl) {
//         options.rules.forEach(rule => {
//             let inputEl = formEl.querySelector(rule.selector);
//             let messageEl = inputEl.parentElement.querySelector(options.message);
//
//             if (options.iconSuccess !== undefined) {
//                 validateRuleCustomWithIcon(inputEl, messageEl, rule);
//             } else {
//                 validateRule(inputEl, messageEl, rule);
//             }
//         })
//     }
// }
//
// // is required function
// isRequired = function (selector, fieldName = '') {
//     // return an object
//     return {
//         // selector (#id_name, .class-name, ...)
//         selector: selector,
//         // name of input(email, user name, password, ...)
//         fieldName: fieldName,
//         // function test
//         test: function (value) {
//             return value ? undefined : `Please enter your ${fieldName}`;
//         }
//     };
// }
// // is email function
// isEmail = function (selector) {
//     // return an object
//     return {
//         // selector (#id_name, .class-name, ...)
//         selector: selector,
//         // function test
//         test: function (value) {
//             return value ? undefined : `Some thing wrong with your email`;
//         }
//     };
// }
//
// // is email function
// isPasswordConfirm = function (passwordSelector, confirmPasswordSelector) {
//     // return an object
//     return {
//         // selector (#id_name, .class-name, ...)
//         passwordSelector: passwordSelector,
//         confirmPasswordSelector: confirmPasswordSelector,
//         // name of input(email, user name, password, ...)
//         // function test
//         test: function (passwordValue, confirmPasswordValue) {
//             return passwordValue === confirmPasswordValue;
//         }
//     };
// }
//
// function validateRuleCustomWithIcon(inputEl, errorMessageEl, rule) {
//     let iconSuccessEl = inputEl.parentElement.querySelector('.icon-success');
//     let iconDangerEl = inputEl.parentElement.querySelector('.icon-danger');
//
//     if (inputEl) {
//
//         inputEl.onblur = function () {
//             console.log('test')
//             let errorMessage = rule.test(inputEl.value);
//             if (errorMessage) {
//                 errorMessageEl.innerHTML = `<p class="text-left text-danger">${errorMessage}</p>`;
//                 inputEl.style.borderColor = 'red';
//                 iconDangerEl.style.display = 'block';
//                 iconSuccessEl.style.display = 'hide';
//             } else {
//                 errorMessageEl.innerHTML = '';
//                 inputEl.style.borderColor = 'green';
//                 iconDangerEl.style.display = 'none';
//                 iconSuccessEl.style.display = 'block';
//             }
//         }
//     }
// }
//
// function validateRule(inputEl, errorMessageEl, rule) {
//
//
//     if (inputEl) {
//         inputEl.onblur = function () {
//             let errorMessage = rule.test(inputEl.value);
//             if (errorMessage) {
//                 errorMessageEl.innerHTML = `<p class="text-left text-danger">${errorMessage}</p>`;
//                 inputEl.style.borderColor = 'red';
//             } else {
//                 errorMessageEl.innerHTML = '';
//                 inputEl.style.borderColor = 'green';
//             }
//         }
//     }
// }

function validator(formSelector) {
    // Get form element by formSelector
    let formEl = document.querySelector(formSelector);

    // get form rule
    let formRules = {};

    /**
     * - If error => return 'error message'
     * - if not error => return undefined
     */
    let validatorRule = {
        required: function (value, name) {
            return value ? null : `${name} is required`;
        },

        email: function (value, name) {
            const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
            return regex.test(value) ? null : `Not valid ${name}`;
        },

        min: function (min) {
            return function (value, name) {
                return value.length >= min ? null : `Please enter more than ${min} character`;
            }
        },
        max: function (max) {
            return function (value, name) {
                return value.length <= max ? null : `Please enter less than ${max} character`;
            }
        }
    }

    function getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            }
            element = element.parentElement;
        }
    }


    if (formEl) {
        // get all Input element that have name and rules attributes
        var inputEls = formEl.querySelectorAll('[name][rules]');

        // Loop each input to get function
        for (let inputEl of inputEls) {
            // con
            let rules = inputEl.getAttribute('rules').split('|');
            for (let rule of rules) {
                // Rule has value (ex: min:6)
                let ruleHasValue;
                let value;
                let isRuleHasValue = rule.includes(':');

                // If rule has value
                if (isRuleHasValue) {
                    // Slit by :
                    ruleHasValue = rule.split(':');
                    // get rule
                    rule = ruleHasValue[0];
                    // get value of that rule
                    value = Number(ruleHasValue[1]);
                }

                // rule function
                let ruleFunction = validatorRule[rule];


                if (isRuleHasValue) {
                    ruleFunction = ruleFunction(value);

                }

                // stored it in an object with rule's array
                if (Array.isArray(formRules[inputEl.name])) {
                    formRules[inputEl.name].push(ruleFunction);
                } else {
                    formRules[inputEl.name] = [ruleFunction];
                }

            }


            // Handle blur event
            inputEl.onblur = handleValidate;
            inputEl.oninput = handleClearValidate;

            function handleValidate(event) {
                let rules = formRules[event.target.name];
                let errorMessage;

                for (let rule of rules) {
                    errorMessage = rule(event.target.value, event.target.name);

                    if (errorMessage) break;
                }

                let formGroupEl = getParent(event.target, '.form-group');
                let formMessageEl = formGroupEl.querySelector('.form-message');

                if (!errorMessage) return true;

                if (formMessageEl) {
                    formMessageEl.innerHTML = `<p class="text-left text-danger">${errorMessage}</p>`;
                    event.target.style.borderColor = 'red';
                }
                return false;

            }

            function handleClearValidate(event) {
                let formGroupEl = getParent(event.target, '.form-group');
                let formMessageEl = formGroupEl.querySelector('.form-message');
                if (event.target.value) {
                    formMessageEl.innerHTML = '';
                    event.target.style.borderColor = 'green';
                }
            }

        }
    }
    formEl.onsubmit = function (event) {
        event.preventDefault();
        let isValid = true;

        for (let inputEl of inputEls) {
            if (!handleValidate({target: inputEl})) {
                isValid = false;
            }

        }
        if(isValid) {
            formEl.submit();
        }

    }


}