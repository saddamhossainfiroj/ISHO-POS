from io import BytesIO, StringIO
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa

#Multiple Documentation
#https://programtalk.com/python-examples-amp/xhtml2pdf.pisa.pisaDocument/ 
#PDF convert and generate link
#https://gearheart.io/blog/how-generate-pdf-files-python-xhtml2pdf-weasyprint-or-unoconv/
def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html = template.render(context_dict)
    result = BytesIO()
    #pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
    #pdf = pisa.pisaDocument(BytesIO(html.encode("ascii",'xmlcharrefreplace')), result)
    pdf = pisa.pisaDocument(BytesIO(html.encode("utf-8")), result)
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None
