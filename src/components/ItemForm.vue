<template>
  <div class="item-form">
    <h2>{{ isEditing ? 'Item szerkesztése' : 'Új item hozzáadása' }}</h2>
    
    <form @submit.prevent="handleSubmit">
      <div>
        <label>Cím *</label>
        <input 
          type="text" 
          v-model="formData.title" 
          required
          placeholder="Add meg az item címét"
        />
      </div>

      <div>
        <label>Leírás</label>
        <textarea 
          v-model="formData.description" 
          placeholder="Add meg az item leírását"
          rows="3"
        ></textarea>
      </div>

      <div>
        <button type="button" @click="$emit('cancel')">
          Mégse
        </button>
        <button type="submit" :disabled="!isFormValid || saving">
          {{ saving ? 'Mentés...' : (isEditing ? 'Frissítés' : 'Hozzáadás') }}
        </button>
      </div>
    </form>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted } from 'vue';

const props = defineProps({
  item: {
    type: Object,
    default: null
  }
});

const emit = defineEmits(['save', 'cancel']);

const saving = ref(false);

const formData = ref({
  title: '',
  description: ''
});

const isEditing = computed(() => !!props.item);

const isFormValid = computed(() => {
  return formData.value.title.trim().length > 0;
});

// Form reset
const resetForm = () => {
  formData.value = {
    title: '',
    description: ''
  };
};

// Props változásakor form frissítése
watch(() => props.item, (newItem) => {
  if (newItem) {
    formData.value = {
      title: newItem.title || '',
      description: newItem.description || ''
    };
  } else {
    resetForm();
  }
}, { immediate: true });

// Form submit
const handleSubmit = async () => {
  if (!isFormValid.value) return;
  
  saving.value = true;
  
  try {
    const itemData = {
      ...formData.value,
      title: formData.value.title.trim()
    };
    
    emit('save', itemData);
  } catch (error) {
    console.error('Hiba a form mentésekor:', error);
  } finally {
    saving.value = false;
  }
};

</script>

<style scoped>
.item-form {
  padding: 20px;
}

.item-form h2 {
  margin: 0 0 20px 0;
}

.item-form div {
  margin-bottom: 15px;
}

.item-form label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

.item-form input,
.item-form textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.item-form textarea {
  resize: vertical;
}

.item-form button {
  padding: 10px 20px;
  margin: 5px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.item-form button:first-of-type {
  background-color: #6c757d;
  color: white;
}

.item-form button:last-of-type {
  background-color: #42b883;
  color: white;
}

.item-form button:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}
</style>
