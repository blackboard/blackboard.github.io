---
layout: post
title: "Feedback parameter definitions" 
id: ally-api-feedback-def
categories: Ally
author: Scott Hurrey
---
# Feedback parameter definitions
Here are the feedback parameters returned when the feedback endpoint is called. The full and meta columns defines which fields are included based on the feedback query parameter. If it is set to true, you get the full response, and the full column will have a <i class="material-icons">check</i>. If it is set to false or omitted, you receive just the meta data, and Meta column will have an <i class="material-icons">check</i>

Parameter | Definition | Full | Meta
---|---|---|---
hash | the content hash used to reference the file by Ally as a Service | <i class="material-icons">check</i> | <i class="material-icons">check</i> 
feedback | the feedback from processing the document, or `null` | <i class="material-icons">check</i> | <i class="material-icons">check</i>
feedback.score | score between 0 (low) and 1 (high) indicating the documents accessibility | <i class="material-icons">check</i> |
feedback.visibility | visibility is the overall accessibility of your document: _low_, _medium_, _high_ or _perfect_ | <i class="material-icons">check</i> |
feedback.report | the contents of the feedback report | <i class="material-icons">check</i> |
feedback.report.results | the results of the feedback report | <i class="material-icons">check</i> |
feedback.report.results.Scanned | was the document scanned? | <i class="material-icons">check</i> |
feedback.report.results.Scanned.score | 0 = scanned, 1 = not scanned | <i class="material-icons">check</i> |
feedback.report.results.Tagged | is the document tagged? | <i class="material-icons">check</i> |
feedback.report.results.Tagged.score | 0 = untagged, 1 = tagged | <i class="material-icons">check</i> |
feedback.report.results.Ocred | was the document [OCR](https://en.wikipedia.org/wiki/Optical_character_recognition)ed? | <i class="material-icons">check</i> |
feedback.report.results.Ocred.score | 0 = no, 1 = yes| <i class="material-icons">check</i> |
feedback.report.results.AlternativeText | report on alternative text for images | <i class="material-icons">check</i> |
feedback.report.results.AlternativeText.snippets | an array containing locations of detected issues | <i class="material-icons">check</i> |
feedback.report.results.AlternativeText.snippets[ ].page | the page number containing the issue | <i class="material-icons">check</i> |
feedback.report.results.AlternativeText.snippets[ ].y0 | the starting y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.AlternativeText.snippets[ ].x0 | the starting x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.AlternativeText.snippets[ ].y1 | the ending y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.AlternativeText.snippets[ ].x1 | the ending x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.AlternativeText.score | alternative text score between 0 (low) and 1 (high) | <i class="material-icons">check</i> |
feedback.report.results.Contrast | report on color contrast | <i class="material-icons">check</i> |
feedback.report.results.Contrast.snippets | an array containing locations of detected issues | <i class="material-icons">check</i> |
feedback.report.results.Contrast.snippets[ ].page | the page number containing the issue | <i class="material-icons">check</i> |
feedback.report.results.Contrast.snippets[ ].y0 | the starting y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.Contrast.snippets[ ].x0 | the starting x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.Contrast.snippets[ ].y1 | the ending y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.Contrast.snippets[ ].x1 | the ending x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.Contrast.score | contrast score between 0 (low) and 1 (high) | <i class="material-icons">check</i> |
feedback.report.results.HeadingsSequential | report on sequential headings | <i class="material-icons">check</i> |
feedback.report.results.HeadingsSequential.snippets | an array containing locations of detected issues | <i class="material-icons">check</i> |
feedback.report.results.HeadingsSequential.snippets[ ].page | the page number containing the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsSequential.snippets[ ].y0 | the starting y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsSequential.snippets[ ].x0 | the starting x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsSequential.snippets[ ].y1 | the ending y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsSequential.snippets[ ].x1 | the ending x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsSequential.score | sequential headings score between 0 (low) and 1 (high) | <i class="material-icons">check</i> |
feedback.report.results.HeadingsHigherLevel.snippets | report on PDF heading levels | <i class="material-icons">check</i> |
feedback.report.results.HeadingsHigherLevel.score | higher-level headings score between 0 (low) and 1 (high) | <i class="material-icons">check</i> |
feedback.report.results.Title | does the document have a title? | <i class="material-icons">check</i> |
feedback.report.results.Title.score | 0 = No, 1 = Yes | <i class="material-icons">check</i> |
feedback.report.results.TableHeaders | report on the existence of headers in tables | <i class="material-icons">check</i> |
feedback.report.results.TableHeaders.snippets | an array containing locations of detected issues | <i class="material-icons">check</i> |
feedback.report.results.TableHeaders.snippets[ ].page | the page number containing the issue | <i class="material-icons">check</i> |
feedback.report.results.TableHeaders.snippets[ ].y0 | the starting y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.TableHeaders.snippets[ ].x0 | the starting x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.TableHeaders.snippets[ ].y1 | the ending y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.TableHeaders.snippets[ ].x1 | the ending x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.TableHeaders.score | table headers score between 0 (low) and 1 (high) | <i class="material-icons">check</i> |
feedback.report.results.LanguagePresence | does the document contain language information | <i class="material-icons">check</i> |
feedback.report.results.LanguagePresence.score | language presence score: 0 = No, 1 = Yes | <i class="material-icons">check</i> |
feedback.report.results.HeadingsPresence | does the document contain headings? | <i class="material-icons">check</i> |
feedback.report.results.HeadingsPresence.score | headings present score, 0 = No, 1 = Yes| <i class="material-icons">check</i> |
feedback.report.results.LanguageCorrect | does the document language declaration match the language used? | <i class="material-icons">check</i> |
feedback.report.results.LanguageCorrect.detectedLanguage | language code declared, i.e. 'en' for English | <i class="material-icons">check</i> |
feedback.report.results.LanguageCorrect.score | language correct score, 0 = No, 1 = Yes| <i class="material-icons">check</i> |
feedback.report.results.HeadingsStartAtOne | report on headings and whether they start at one | <i class="material-icons">check</i> |
feedback.report.results.HeadingsStartAtOne.snippets | an array containing locations of detected issues | <i class="material-icons">check</i> |
feedback.report.results.HeadingsStartAtOne.snippets[ ].page | the page number containing the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsStartAtOne.snippets[ ].y0 | the starting y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsStartAtOne.snippets[ ].x0 | the starting x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsStartAtOne.snippets[ ].y1 | the ending y axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsStartAtOne.snippets[ ].x1 | the ending x axis location on the page of the issue | <i class="material-icons">check</i> |
feedback.report.results.HeadingsStartAtOne.score |  score between 0 (low) and 1 (high) | <i class="material-icons">check</i> |
feedback.report.results.LibraryReference | **Deprecated** Not used. This will always be null and will be removed in a future release | <i class="material-icons">check</i> |
feedback.report.results.LibraryReference.score | **Deprecated** Not used. This will always be null and will be removed in a future release | <i class="material-icons">check</i> |
feedback.report.suggestions | the portion of the report that displays improvement suggestions | <i class="material-icons">check</i> |
feedback.report.suggestions.HeadingsSequential | the document's total score if all headings are made sequential | <i class="material-icons">check</i> |
feedback.report.suggestions.Title | the document's total score if the title is added | <i class="material-icons">check</i> |
feedback.report.suggestions.TableHeaders | the document's total score if all tables include headers | <i class="material-icons">check</i> |
feedback.report.suggestions.HeadingsStartAtOne | the document's total score if all headings hierarchy starts at one | <i class="material-icons">check</i> |
feedback.report.suggestions.AlternativeText | the document's total score if all images contain alternative text | <i class="material-icons">check</i> |
feedback.report.suggestions.Contrast | the document's total score if all color contrast issues are corrected | <i class="material-icons">check</i> |
feedback.report.suggestions.LibraryReference | **Deprecated** Not used. This will always be null and will be removed in a future release | <i class="material-icons">check</i> |
formats | not currently used, will always be null | <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata | document metadata | <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata.name | the name  of the processed file | <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata.decorative | **Deprecated** Not used. This will always be null and will be removed in a future release | <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata.description | **Deprecated** Not used. This will always be null and will be removed in a future release | <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata.fileType | the file type of the processed file | <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata.mimeType | the mime type of the processed file| <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata.isVersioned | **Deprecated** Not used. This will always be null and will be removed in a future release | <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata.isSeizureInducing | will the processed file cause seizures? | <i class="material-icons">check</i> | <i class="material-icons">check</i>
metadata.libraryReference | **Deprecated** Not used. This will always be null and will be removed in a future release | <i class="material-icons">check</i> | <i class="material-icons">check</i>

For more information about the Ally accessibility tests, visit the [Accessibility Checklist](https://help.blackboard.com/Ally/Ally_for_LMS/Administrator/Institution_Report/Accessibility_Checklist) page on help.blackboard.com.