<template>
  <div v-if="errors.length" class="mt-15">
    <el-alert
      :closable="false"
      :description="errors.join('。')"
      title="エラー"
      type="error"
      show-icon
    />
  </div>
</template>

<script>
export default {
  props: {
    errors: {
      type: Array,
      default: () => {}
    },
    showLabel: {
      type: Boolean,
      default: true
    }
  }
}
</script>
