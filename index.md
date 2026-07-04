---
layout: home
---



<div class="row">

  {% for cat in site.data.links %}
  <div class="col-4">
    <article class="card">
      <header><h4>{{ cat.category }}</h4></header>
      <div class="table">
        <table>
          <tbody>
          {% for each in cat.links %}
            <tr>
              <td>{% if each.url1 %}<a href="{{ each.url1 }}"><strong>{{ each.name }}</strong></a>{% else %}<strong>{{ each.name }}</strong>{% endif %}</td>
              <td>
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
    </article>
  </div>
  {% endfor %}

</div>
