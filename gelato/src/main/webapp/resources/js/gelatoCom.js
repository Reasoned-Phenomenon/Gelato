class CustomTextEditor {
  constructor(props) {
    const el = document.createElement('input');

    el.type = 'checkbox';
    el.value = String(props.value);

    this.el = el;
  }

  getElement() {
    return this.el;
  }

  getValue() {
    return this.el.value;
  }

  mounted() {
    this.el.select();
  }
}