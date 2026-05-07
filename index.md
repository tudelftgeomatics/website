---
layout: home
---

<div class="row">

  {% for cat in site.data.links %}
  <div class="col-4"> 
    <div class="card">
      <header><h4>{{ cat.category }}</h4></header>
      <table class="striped ">
        <tbody>
        {% for each in cat.links %}
          <tr>
            <td>{% if each.url1 %}<a href="{{ each.url1 }}">{{ each.name }}</a>{% else %}{{ each.name }}{% endif %}</td>
            <td class="text-left">
            {% if each.url2 %}
              <a href="{{ each.url2 }}">{{ each.desc }}</a>
            {% elsif each.desc %}
              {{ each.desc }}
            {% endif %}
            </td>
          </tr>
        {% endfor %}
        </tbody>
      </table>
    </div>
  </div>
  {% endfor %}

</div>
