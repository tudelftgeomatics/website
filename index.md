---
layout: home
---

{% assign first_cat = site.data.links | first %}
{% assign latest = first_cat.links | first %}
<div role="alert" data-variant="success" style="margin: var(--space-5) 0">
  <strong>{{ latest.name }} — {{ latest.desc }}.</strong>
  {% if latest.url2 or latest.url1 %}
    <a href="{{ latest.url2 | default: latest.url1 }}">Read more →</a>
  {% endif %}
</div>

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
              <td>{% if each.url1 %}<a href="{{ each.url1 }}">{{ each.name }}</a>{% else %}{{ each.name }}{% endif %}</td>
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