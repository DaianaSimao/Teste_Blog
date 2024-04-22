// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

// Js de comentarios
document.addEventListener("turbo:submit-end", function(event) {
  if (event.target.matches("form#new_comment") && event.detail.success) {
    const commentsFrame = document.getElementById("comments");
    Turbo.visit(window.location.href, { action: "replace", target: commentsFrame });
  }
});

// Js de sugestao de pesquisa de tag

document.addEventListener('DOMContentLoaded', function() {
  const searchInput = document.querySelector('#search-input');
  const suggestionsContainer = document.querySelector('#suggestions-container');

  searchInput.addEventListener('input', function(event) {
    const searchText = event.target.value.trim();

    if (searchText.length > 0) {
      fetchSuggestions(searchText);
    } else {
      suggestionsContainer.innerHTML = '';
    }
  });

  function fetchSuggestions(searchText) {
    fetch('/search_suggestions?search=' + searchText)
      .then(response => response.json())
      .then(data => {
        renderSuggestions(data);
      })
      .catch(error => {
        console.error('Error fetching suggestions:', error);
      });
  }

  function renderSuggestions(suggestions) {
    suggestionsContainer.innerHTML = '';

    if (suggestions.length > 0) {
      const ul = document.createElement('ul');
      suggestions.forEach(suggestion => {
        const li = document.createElement('li');
        li.textContent = suggestion;
        li.addEventListener('click', function() {
          searchInput.value = suggestion;
          suggestionsContainer.innerHTML = '';
        });
        ul.appendChild(li);
      });
      suggestionsContainer.appendChild(ul);
    } else {
      const p = document.createElement('p');
      p.textContent = 'Nenhuma sugestão encontrada.';
      suggestionsContainer.appendChild(p);
    }
  }
});

// Js das tags de crição de post

document.addEventListener('DOMContentLoaded', function() {
  $('#tag-dropdown').change(function() {
    var selectedTags = $(this).val();
    $('#selected-tags').empty();

    if(selectedTags) {
      selectedTags.forEach(function(tagId) {
        var tagName = $('#tag-dropdown option[value="' + tagId + '"]').text();
        $('#selected-tags').append('<span class="tag">' + tagName + '</span>');
      });
    }
  });
});